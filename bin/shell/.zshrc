# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/frances/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#!/usr/bin/sh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# VS Code as default editor
export EDITOR="code -w"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="refined"
# ZSH_THEME="materialshell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# aliases
alias zshconfig="subl $HOME/.zshrc"
alias ohmyzsh="cd $HOME/.oh-my-zsh"

# home folders
alias home="cd $HOME && clear"
alias apps="cd $HOME/Applications/"
alias music="cd $HOME/Music/"
alias movies="cd $HOME/Movies/"
alias dropbox="cd $HOME/Dropbox/"
alias pictures="cd $HOME/Pictures/"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=1

# Uncomment following line if you want to disable auto setting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting git macos ruby zsh-wakatime zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Homebrew
export PATH=/usr/local/bin:$PATH

# npm
export PATH=/usr/local/share/npm/bin:$PATH

# Make /Applications the default location of apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# cd & ls-a
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls -a
}

# reset launchpad
function reset_launchpad() {
  defaults write com.apple.dock ResetLaunchPad -bool TRUE;
  killAll Dock;
}

# reset menubar
function reset_menubar() {
  killall -KILL SystemUIServer
}

# pure
# autoload -U promptinit; promptinit
# prompt pure

# zsh-syntax-highlighting
source $ZSH/oh-my-zsh.sh

# For brew, at least
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  2>/dev/null
$(nvm use node) 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"