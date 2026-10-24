# AGENTS.md

Guidance for AI coding agents (Claude Code, Copilot, Codex, and others) working in this repository.

## What this repo is

Frances's macOS setup: shell configs, Homebrew casks, fonts, terminal themes and macOS defaults. It's installed by cloning to `~/.dotfiles` and running the scripts below, which copy files into `$HOME` and change system settings.

## Don't run the install scripts

`bootstrap.sh` and everything in `init/` install software, run `sudo`, overwrite files in `$HOME` and change macOS settings. Never run them to "test" a change, in any form (`sh`, `bash`, `source`, `.`, `./`). Don't run `sudo`, `defaults write`, `brew install` or `chsh` either. Check shell changes with the commands under [Checks](#checks) instead.

Locally, `.claude/settings.json` denies these commands and `.claude/hooks/guard-installers.sh` blocks them however they're chained. Claude Code Project threads don't load repo settings or hooks, so this rule is what applies there.

## Layout

| Path | What's there |
|---|---|
| `bootstrap.sh` | Entry point: Homebrew, core formulae, bash files |
| `init/.casks`, `.fonts`, `.npm`, `.osx`, `.shell`, `.gituser` | Install steps, run one at a time with `sh ~/.dotfiles/init/<name>` (see README) |
| `config/shell/` | Shell dotfiles copied into `$HOME` (`.zshrc`, `.bashrc`, ...), plus `zsh/.p10k.zsh` and terminal themes for Hyper, iTerm and Terminal |
| `config/fonts/` | Font files installed by `init/.fonts` |
| `config/alfred/`, `config/tower/` | App themes |
| `git/.gitconfig` | Global Git config, copied to `~/.gitconfig` by option 3 of `init/.gituser` |
| `git/gitignore_global` | Global ignore patterns, kept for reference; no script installs it |
| `.github/` | GitHub settings only: workflows, Dependabot, community files |

If you move a file, update every script that copies it (search `bootstrap.sh` and `init/` for the path).

## Making changes

- Scripts are Bash (`#!/usr/bin/env bash`) for macOS, indented with 2 spaces (see `.editorconfig`). Quote variables and pass ShellCheck. `.shellcheckrc` disables SC1090 and SC1091, since the scripts source files that only exist on the machine being set up.
- Never commit secrets, tokens, SSH keys or machine-specific paths beyond `$HOME`.
- Keep the README's install steps in sync when you add or rename an `init/` script.
- CI comes from the shared workflows in [FrancesCoronel/workflows](https://github.com/FrancesCoronel/workflows).

## Checks

Run these before opening a PR. CI runs the ShellCheck one on every file whose first line is a `sh`, `bash` or `dash` shebang, plus `*.sh` and `*.bash`:

```bash
git ls-files -z | while IFS= read -r -d '' f; do
  case "$f" in *.zsh) continue ;; *.sh|*.bash) printf '%s\0' "$f"; continue ;; esac
  head -n1 "$f" | grep -qE '^#!.*\b(ba|da)?sh\b' && printf '%s\0' "$f"
done | xargs -0 shellcheck --severity style
```

CI doesn't lint the zsh files (`config/shell/.zshrc`, `.zprofile`, `.zshenv`, `zsh/.p10k.zsh`). Check any you change with `zsh -n <file>`.

Locally, `.claude/hooks/shellcheck-edited.sh` runs ShellCheck (or `zsh -n`) on each file Claude edits and reports problems back in the same turn.
