#!/usr/bin/env bash
# PostToolUse hook for Edit|Write: lint the file Claude just changed so it
# fixes problems in the same turn. Bash/sh scripts get ShellCheck (same
# severity as CI); zsh files get `zsh -n`. Exit 2 feeds the output back.
set -uo pipefail

f=$(jq -r '.tool_input.file_path // empty')
[ -n "$f" ] && [ -f "$f" ] || exit 0

case "$f" in
  *.zsh | */.zshrc | */.zprofile | */.zshenv | */.zlogin | */.zlogout)
    command -v zsh >/dev/null 2>&1 || exit 0
    if ! out=$(zsh -n "$f" 2>&1); then
      printf 'zsh -n failed for %s:\n%s\n' "$f" "$out" >&2
      exit 2
    fi
    exit 0
    ;;
  *.sh | *.bash) ;;
  *) head -n1 "$f" | grep -qE '^#!.*\b(ba|da)?sh\b' || exit 0 ;;
esac

command -v shellcheck >/dev/null 2>&1 || exit 0
if ! out=$(shellcheck --severity style "$f" 2>&1); then
  printf 'ShellCheck found problems in %s; fix them before moving on:\n%s\n' "$f" "$out" >&2
  exit 2
fi
exit 0
