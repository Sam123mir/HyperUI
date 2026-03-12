import os
import re

from bundle import resolve_path

modules = {}
for root, dirs, files in os.walk('build/temp'):
    for file in files:
        if file.endswith('.lua'):
            original_path = os.path.relpath(os.path.join(root, file), 'build/temp').replace('\\', '/')
            module_name = original_path.replace('.lua', '')
            if module_name.endswith('/init'):
                module_name = module_name[:-len('/init')]
            if module_name == 'init':
                module_name = 'main'
            
            with open(os.path.join(root, file), "r", encoding="utf-8") as f:
                content = f.read()
                modules[module_name] = {"content": content, "original_path": original_path.replace('.lua', '')}

print("api" in modules)
print(modules["api"])

for name, data in modules.items():
    content = data["content"]
    original_path_no_ext = data["original_path"]
    
    def replace_require(match):
        req_content = match.group(1).strip()
        resolved = resolve_path(original_path_no_ext, req_content)
        return f'_require("{resolved}")'
    
    new_content = re.sub(r'require\s*\(\s*(script[^)]*)\s*\)', replace_require, content)
    if name == "api":
        print(new_content)
