import os
import re

def process_file(path, namespace):
    filename = os.path.basename(path)
    if filename == "default.nix":
        return
    name = filename.replace(".nix", "")
    
    with open(path, "r") as f:
        content = f.read()

    # Match the module argument block, e.g., `{ config, pkgs, ... }:\n`
    # It can be multi-line.
    match = re.match(r'^(\{.*?\}:)\s*\{', content, re.DOTALL)
    if not match:
        print(f"Could not parse {path}")
        return
        
    arg_block = match.group(1)
    
    # Extract the body, removing the outer `{` and `}`
    # We find the first `{` after arg_block
    body_start = match.end() - 1
    # Find the matching closing brace for body_start
    brace_count = 0
    body_end = -1
    for i in range(body_start, len(content)):
        if content[i] == '{':
            brace_count += 1
        elif content[i] == '}':
            brace_count -= 1
            if brace_count == 0:
                body_end = i
                break
                
    if body_end == -1:
        print(f"Could not find matching brace in {path}")
        return
        
    body_content = content[body_start+1:body_end].strip()
    
    # We need to extract `imports = [ ... ];` if it exists at the top level
    imports_match = re.search(r'^\s*imports\s*=\s*\[(.*?)\];', body_content, re.DOTALL | re.MULTILINE)
    imports_block = ""
    if imports_match:
        imports_block = f"  imports = [{imports_match.group(1)}];\n\n"
        # remove it from body_content
        body_content = body_content[:imports_match.start()] + body_content[imports_match.end():]
        body_content = body_content.strip()

    # Check if 'lib' is in arg_block, if not add it
    if "lib," not in arg_block and "lib " not in arg_block:
        # insert lib, after the first '{'
        arg_block = arg_block.replace("{", "{ lib,", 1)
        
    # Check if 'config' is in arg_block, if not add it
    if "config," not in arg_block and "config " not in arg_block:
        arg_block = arg_block.replace("{", "{ config,", 1)

    new_content = f"""{arg_block}
{{
  options.{namespace}.{name}.enable = lib.mkEnableOption "{name}";

{imports_block}  config = lib.mkIf config.{namespace}.{name}.enable {{
{chr(10).join("    " + line for line in body_content.split(chr(10)))}
  }};
}}
"""
    with open(path, "w") as f:
        f.write(new_content)
    print(f"Processed {path}")

for f in os.listdir("modules/nixos"):
    if f.endswith(".nix"):
        process_file(os.path.join("modules/nixos", f), "sys")
        
for f in os.listdir("modules/home-manager"):
    if f.endswith(".nix"):
        process_file(os.path.join("modules/home-manager", f), "sys.hm")

