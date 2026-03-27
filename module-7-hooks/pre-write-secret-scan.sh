#!/usr/bin/env bash
# .claude/hooks/pre-write-secret-scan.sh
# Scans content for hardcoded secrets before file writes.
# Exit code 2 = BLOCK the tool call.
set -euo pipefail

INPUT=$(cat)
CONTENT=$(echo "$INPUT" | jq -r '(.tool_input.content // .tool_input.new_string) // empty')

if [ -z "$CONTENT" ]; then exit 0; fi

PATTERNS=(
  'AKIA[0-9A-Z]{16}'
  'AIza[0-9A-Za-z_-]{35}'
  'sk-[0-9a-zA-Z]{48}'
  'ghp_[0-9a-zA-Z]{36}'
  "password\\s*=\\s*[\"'][^\"']+"
  'jdbc:[a-z]+://[^\s]+'
  '-----BEGIN (RSA |EC )?PRIVATE KEY-----'
)

FOUND=0
for pat in "${PATTERNS[@]}"; do
  if echo "$CONTENT" | grep -qE "$pat" 2>/dev/null; then
    echo "SECRET DETECTED in content to be written:" >&2
    echo "$CONTENT" | grep -nE "$pat" >&2
    FOUND=1
  fi
done

if [ $FOUND -eq 1 ]; then
  echo "Remove secrets before writing. Use environment variables instead." >&2
  exit 2
fi
exit 0
