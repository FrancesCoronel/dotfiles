# AGENTS.md

Guidance for AI coding agents (Claude Code, Copilot, Codex, and others) working in this repository.

## What this repo is

Frances's macOS setup: shell configs, Homebrew casks, fonts, terminal themes and macOS defaults. It's installed by cloning to `~/.dotfiles` and running the scripts below, which copy files into `$HOME` and change system settings.

## Don't run the install scripts

`bootstrap.sh` and everything in `init/` install software, run `sudo`, overwrite files in `$HOME` and change macOS settings. Never run them to "test" a change. Check shell changes with ShellCheck instead.

## Layout

| Path | What's there |
|---|---|
| `bootstrap.sh` | Entry point: Homebrew, core formulae, bash files |
| `init/.casks`, `.fonts`, `.npm`, `.osx`, `.shell`, `.gituser` | Install steps, run one at a time with `sh ~/.dotfiles/init/<name>` (see README) |
| `bin/shell/` | Shell dotfiles copied into `$HOME` (`.zshrc`, `.bashrc`, ...), plus `zsh/.p10k.zsh` and terminal themes for Hyper, iTerm and Terminal |
| `bin/fonts/` | Font files installed by `init/.fonts` |
| `bin/alfred/`, `bin/tower/` | App themes |
| `.github/.gitconfig`, `.github/.gitignore` | Global Git config and ignore file (not GitHub settings, despite the folder) |

Despite the name, nothing in `bin/` is an executable. If you move a file, update every script that copies it (search `bootstrap.sh` and `init/` for the path).

## Making changes

- Scripts are Bash (`#!/usr/bin/env bash`) for macOS. Quote variables and pass ShellCheck; `.shellcheckrc` holds the repo's settings once added.
- Never commit secrets, tokens, SSH keys or machine-specific paths beyond `$HOME`.
- Keep the README's install steps in sync when you add or rename an `init/` script.
- CI comes from the shared workflows in [FrancesCoronel/workflows](https://github.com/FrancesCoronel/workflows).
