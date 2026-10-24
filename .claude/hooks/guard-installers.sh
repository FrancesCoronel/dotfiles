#!/usr/bin/env bash
# PreToolUse hook for Bash: blocks commands that would run the installers
# (bootstrap.sh, init/*) or change the machine (sudo, defaults write, brew
# install, chsh). Permission deny rules are prefix matches, so this also
# catches `cd x && sh init/.osx`, `source init/.osx` and `bash -c "..."`.
# Reading, grepping or ShellChecking these files is still allowed.
set -euo pipefail

cmd=$(jq -r '.tool_input.command // empty')
[ -n "$cmd" ] || exit 0

# Installer files, matched by path or basename.
target_re='(^|/)(bootstrap\.sh|\.(casks|fonts|npm|osx|shell|gituser|hushlogin))$'
# Words that run their arguments as a command or script.
runner_re='^(sh|bash|zsh|dash|ksh|source|\.|exec|eval|env|command|nohup|time|xargs|sudo)$'

block() {
  echo "Blocked by .claude/hooks/guard-installers.sh: $1" >&2
  echo "AGENTS.md: never run bootstrap.sh or init/* and never change system settings. Check shell changes with ShellCheck (shellcheck --severity style <file>) or zsh -n <file> instead." >&2
  exit 2
}

# check_words WORD...: inspect one simple command.
check_words() {
  # Skip leading VAR=value assignments.
  while [ "$#" -gt 0 ] && [[ "$1" =~ ^[A-Za-z_][A-Za-z0-9_]*= ]]; do shift; done
  [ "$#" -gt 0 ] || return 0
  local w=$1
  shift

  if [[ "$w" =~ $target_re ]]; then block "runs installer $w"; fi

  case "$w" in
    sudo | */sudo) block "uses sudo" ;;
    chsh | */chsh) block "changes the login shell" ;;
    defaults | */defaults)
      case "${1:-}" in write | delete | import) block "changes macOS defaults" ;; esac ;;
    brew | */brew)
      case "${1:-}" in
        install | reinstall | uninstall | remove | rm | upgrade | bundle | tap | untap | link | unlink | cleanup | services | autoremove)
          block "changes Homebrew packages (brew $1)" ;;
      esac ;;
    scutil | */scutil)
      case "${1:-}" in --set) block "changes the computer name" ;; esac ;;
  esac

  if [[ "$w" =~ $runner_re ]]; then
    local a
    for a in "$@"; do
      if [[ "$a" =~ $target_re ]]; then block "runs installer $a via $w"; fi
    done
    # Re-check what the runner runs, skipping its options.
    while [ "$#" -gt 0 ] && [[ "$1" == -* ]]; do shift; done
    check_words "$@"
  fi
}

# Split into simple commands on shell separators and subshell markers,
# drop quotes, then check each one.
segments=$(printf '%s\n' "$cmd" | tr ';&|`(){}' '\n' | tr -d "\"'")
while IFS= read -r seg; do
  read -r -a words <<<"$seg" || true
  [ "${#words[@]}" -gt 0 ] || continue
  check_words "${words[@]}"
done <<<"$segments"

exit 0
