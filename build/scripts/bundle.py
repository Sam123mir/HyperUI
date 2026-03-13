import os
import re
import datetime
import subprocess
import shutil

SRC_DIR = "src/v2"
TEMP_DIR = "build/temp"
OUTPUT_FILE = "dist/HyperUI.lua"
VERSION = "2.0.0"

def resolve_path(current_module, require_path):
    parts = []
    if require_path.startswith("script"):
        parts.append("script")
        # Handle .Name or ["Name"] or ['Name'] or :WaitForChild("Name") or :FindFirstChild("Name")
        # Regex to match .Name, ["Name"], :WaitForChild("Name"), etc.
        pattern = r'\.(?P<dot>[A-Za-z0-9_]+)|\[(?P<quote1>[\'"])(?P<bracket>.*?)(?P=quote1)\]|:(?:WaitForChild|FindFirstChild)\s*\(\s*(?P<quote2>[\'"])(?P<child>.*?)(?P=quote2)\s*\)'
        matches = re.finditer(pattern, require_path)
        for m in matches:
            if m.group('dot'):
                parts.append(m.group('dot'))
            elif m.group('bracket'):
                parts.append(m.group('bracket'))
            elif m.group('child'):
                parts.append(m.group('child'))
    else:
        # Absolute or string-based require
        return require_path.replace('.', '/')
    
    current_parts = current_module.split('/')
    # target_parts should include the script itself so each .Parent pops it
    target_parts = list(current_parts)
    
    if parts and parts[0] == "script":
        i = 1
        while i < len(parts) and parts[i] == "Parent":
            if target_parts:
                target_parts.pop()
            i += 1
        
        target_parts.extend(parts[i:])
    else:
        return require_path.replace('.', '/')
    
    return "/".join(target_parts)

def bundle():
    # 0. Process source files with Darklua
    print("Running Darklua preprocessing...")
    if os.path.exists(TEMP_DIR):
        shutil.rmtree(TEMP_DIR)
    
    result = subprocess.run(["darklua", "process", SRC_DIR, TEMP_DIR, "-c", "darklua.json"], capture_output=True, text=True)
    if result.returncode != 0:
        print("Darklua Error:")
        print(result.stderr)
        return
    else:
        print("Darklua preprocessing successful.")

    modules = {}
    
    # 1. Collect all modules from temp directory
    for root, dirs, files in os.walk(TEMP_DIR):
        for file in files:
            if file.endswith(".lua") or file.endswith(".luau"):
                original_path = os.path.relpath(os.path.join(root, file), TEMP_DIR).replace("\\", "/")
                
                # Strip extension
                module_name = original_path
                if module_name.endswith(".lua"):
                    module_name = module_name[:-len(".lua")]
                elif module_name.endswith(".luau"):
                    module_name = module_name[:-len(".luau")]
                
                # Handle /init files
                if module_name.endswith("/init"):
                    module_name = module_name[:-len("/init")]
                elif module_name == "init":
                    module_name = "main"
                
                # SPECIAL HACK for Wally packages:
                # Packages/_Index/author_name@version/pkg_name/src/module -> Packages/_Index/author_name@version/pkg_name/module
                # This matches Rojo's $path: "src" or $path: "lib" behavior.
                for src_dir in ["/src/", "/lib/"]:
                    if "Packages/_Index/" in module_name and src_dir in module_name:
                        module_name = module_name.replace(src_dir, "/")
                        break
                
                # Handle end of path cases
                if "Packages/_Index/" in module_name:
                    if module_name.endswith("/src"):
                        module_name = module_name[:-len("/src")]
                    elif module_name.endswith("/lib"):
                        module_name = module_name[:-len("/lib")]
                
                with open(os.path.join(root, file), "r", encoding="utf-8") as f:
                    content = f.read()
                    if module_name in modules:
                        print(f"WARNING: Collision detected for module '{module_name}'! Overwriting previous.")
                    modules[module_name] = {"content": content, "original_path": original_path}

    # 2. Rewrite requires
    processed_modules = {}
    for name, data in modules.items():
        content = data["content"]
        
        # Regex to match require(script...) handling one level of nested parens
        # Also handle require('path') and require("path")
        require_regex = r'require\s*\(\s*(script(?:[^()]|\([^()]*\))*|(?P<quote>[\'"])(.*?)(?P=quote))\s*\)'
        
        def replace_require(match):
            req_content = match.group(1).strip()
            
            # If it's a quoted string, remove quotes for resolution
            if req_content.startswith("'") or req_content.startswith('"'):
                req_content = req_content[1:-1]
                
            # Use 'name' (the module key) as the base for resolution
            resolved = resolve_path(name, req_content)
            return f'_require("{resolved}")'
        
        new_content = re.sub(require_regex, replace_require, content)
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
        for name, content in sorted(processed_modules.items()):
            f.write(f'_modules["{name}"] = function()\n')
            indented = "\n".join("    " + line for line in content.splitlines())
            f.write(indented + "\n")
            f.write("end\n\n")
        
        f.write(loader)
        f.write("\nreturn _require('main')\n")

if __name__ == "__main__":
    bundle()
    print(f"Successfully bundled HyperUI v2 into {OUTPUT_FILE}")
