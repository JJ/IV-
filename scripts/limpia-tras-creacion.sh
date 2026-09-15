#!/bin/bash

# 1) Remove common AI skills/agents/context files and directories (best-effort)
rm -rf .github/copilot-instructions.md
rm -f AGENTS.md CONTEXT.md

# 2) Keep only markdown table headers in proyectos/*.md

            for f in proyectos/*.md; do
              [ -f "$f" ] || continue
              awk '
                BEGIN { in_table=0 }
                /^ *\|/ {
                  if (in_table==0) { print; getline; print; in_table=1 }
                  next
                }
                { if (in_table) in_table=0; print }
              ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
            done

# 3) Delete renovate.json if present
rm -f renovate.json scripts/limpia-tras-creacion.sh

# 4) Empty CSVs in data/ keeping only header; convert JSON files to same structure with empty values

            # CSVs: keep first line only
            find data -type f -name "*.csv" -print0 | while IFS= read -r -d '' csv; do
              head -n 1 "$csv" > "$csv.tmp" || true
              mv "$csv.tmp" "$csv"
            done

            # Ensure jq exists for JSON processing
            if ! command -v jq >/dev/null 2>&1; then
              apt-get update -qq
              apt-get install -y -qq jq
            fi

            # JSONs: empty them completely -> {} for objects, [] for arrays, null otherwise
            find data -type f -name "*.json" -print0 | while IFS= read -r -d '' js; do
              jq 'if type=="object" then {} elif type=="array" then [] else null end' "$js" > "$js.tmp" && mv "$js.tmp" "$js"
            done

