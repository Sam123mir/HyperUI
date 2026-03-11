import os
import re
import datetime

SRC_DIR = "src/v2"
OUTPUT_FILE = "dist/HyperUI.lua"
VERSION = "2.0.0"

def resolve_path(current_module, require_path):
    parts = require_path.split('.')
    current_parts = current_module.split('/')
    
    # Start with the directory of current file
    target_parts = current_parts[:-1]
    
    i = 0
    if parts[0] == "script":
        i += 1
        while i < len(parts) and parts[i] == "Parent":
            if target_parts:
                target_parts.pop()
            i += 1
        
        # Add remaining parts
        target_parts.extend(parts[i:])
    else:
        # Absolute from root or other handling (not needed here based on structure)
        return require_path.replace('.', '/')
    
    return "/".join(target_parts)

def bundle():
    modules = {}
    
    # 1. Collect all modules
    for root, dirs, files in os.walk(SRC_DIR):
        for file in files:
            if file.endswith(".lua"):
                path = os.path.relpath(os.path.join(root, file), SRC_DIR)
                module_name = path.replace("\\", "/").replace(".lua", "")
                if module_name.endswith("/init"):
                    module_name = module_name[:-len("/init")]
                if module_name == "init":
                    module_name = "main"
                
                with open(os.path.join(root, file), "r", encoding="utf-8") as f:
                    content = f.read()
                    modules[module_name] = content

    # 2. Rewrite requires
    processed_modules = {}
    for name, content in modules.items():
        # Match require(...) calls
        # We look for require(script...) or similar patterns
        def replace_require(match):
            req_content = match.group(1).strip()
            resolved = resolve_path(name if name != "main" else "init", req_content)
            return f'_require("{resolved}")'
        
        new_content = re.sub(r'require\s*\(\s*(script[^)]*)\s*\)', replace_require, content)
        processed_modules[name] = new_content

    header = f"""-- HyperUI Framework
-- Version: {VERSION}
-- Build Date: {datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}
-- Distribution: Single File

local _modules = {{}}
local _cache = {{}}
local _require
"""

    loader = """
_require = function(name)
    if _cache[name] then return _cache[name] end
    local module = _modules[name]
    if not module then error("Module not found: " .. tostring(name)) end
    local result = module()
    _cache[name] = result
    return result
end

-- Override global require inside the bundled environment
local require = _require
"""

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write(header)
        f.write("local _modules = {}\n")
        for name, content in processed_modules.items():
            f.write(f'_modules["{name}"] = function()\n')
            indented = "\n".join("    " + line for line in content.splitlines())
            f.write(indented + "\n")
            f.write("end\n\n")
        
        f.write(loader)
        f.write("\nreturn _require('main')\n")

if __name__ == "__main__":
    bundle()
    print(f"Successfully bundled HyperUI v2 into {OUTPUT_FILE}")
