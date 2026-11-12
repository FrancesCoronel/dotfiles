## Exports

# Update path
#!/usr/bin/sh
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Homebrew (/opt/homebrew on Apple Silicon, /usr/local on Intel).
# .zprofile sets this up for login shells; this covers the others.
if [ -z "$HOMEBREW_PREFIX" ]; then
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# nvm, installed with Homebrew
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# Fix invalid input issue
export LC_CTYPE=C
export LANG=C

# VS Code as default editor
export EDITOR="code -w"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=1

## Aliases

alias zshconfig="subl $HOME/.zshrc"
alias ohmyzsh="cd $HOME/.oh-my-zsh"

# Home folders
alias home="cd $HOME && clear"
alias apps="cd $HOME/Applications/"
alias music="cd $HOME/Music/"
alias movies="cd $HOME/Movies/"
alias pictures="cd $HOME/Pictures/"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment following line if you want to disable auto setting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git macos ruby zsh-wakatime zsh-syntax-highlighting zsh-autosuggestions)

# Make /Applications the default location of apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Colorful file listings with icons, when eza is installed
command -v eza > /dev/null && alias ls="eza --icons --group-directories-first"

# Show all files when changing directory
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls -a
}

# Finalizing
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source $ZSH/oh-my-zsh.sh

# Starship prompt
command -v starship > /dev/null && eval "$(starship init zsh)"
