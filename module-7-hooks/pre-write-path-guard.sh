#!/usr/bin/env bash
# .claude/hooks/pre-write-path-guard.sh
# Prevents writes to protected files and directories.
# Exit code 2 = BLOCK the tool call.
set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

PROTECTED=('.env' '.env.production' '.env.local' 'terraform/'
  '.github/workflows/' 'k8s/' 'docker-compose.prod' 'id_rsa')

for prot in "${PROTECTED[@]}"; do
  if echo "$FILE_PATH" | grep -q "$prot"; then
    echo "BLOCKED: $FILE_PATH is protected." >&2
    exit 2
  fi
done
exit 0
