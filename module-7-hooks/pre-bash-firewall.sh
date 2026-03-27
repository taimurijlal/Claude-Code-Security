#!/usr/bin/env bash
# .claude/hooks/pre-bash-firewall.sh
# Blocks dangerous shell commands before execution.
# Exit code 2 = BLOCK the tool call.
set -euo pipefail

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

BLOCKED_PATTERNS=(
  'rm -rf /'
  'rm -rf ~'
  'git reset --hard'
  'git push --force'
  'chmod 777'
  'curl.*|.*sh'
  'wget.*|.*sh'
  '> /dev/sda'
  'mkfs\.'
  ':(){:|:&};:'
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$CMD" | grep -qiE "$pattern"; then
    echo "BLOCKED: Matches dangerous pattern: $pattern" >&2
    exit 2
  fi
done

exit 0
