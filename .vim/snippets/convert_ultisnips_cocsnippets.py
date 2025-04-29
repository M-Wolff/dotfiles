import os
import json
import re

def convert_snippet(name, trigger, body):
    return {
        name: {
            "prefix": trigger,
            "body": body.splitlines(),
            "description": name
        }
    }

def parse_ultisnips_file(path):
    snippets = {}
    with open(path, 'r') as f:
        content = f.read()

    pattern = re.compile(r'snippet\s+(\S+)\s+"(.*?)"(.*?)endsnippet', re.S)
    for match in pattern.finditer(content):
        trigger, description, body = match.groups()
        body = body.strip()
        snippet = convert_snippet(description, trigger, body)
        snippets.update(snippet)

    return snippets

# Beispiel: Konvertiere tex.snippets
ultisnips_file = "tex.snippets"
coc_output = "tex.json"
snippets = parse_ultisnips_file(ultisnips_file)

with open(coc_output, 'w') as f:
    json.dump(snippets, f, indent=2)

print(f"Converted {len(snippets)} snippets to coc format.")
