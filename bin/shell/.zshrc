#!/usr/bin/sh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# nano as default editor
export EDITOR=subl

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fvcproductions"

# Aliases
alias zshconfig="subl $HOME/.zshrc"
alias ohmyzsh="cd $HOME/.oh-my-zsh"

# Home Folders
# ---------------------------------------------------------------------------

alias home="$HOME && clear"
alias apps="cd $HOME/Applications/"
alias music="cd $HOME/Music/"
alias movies="cd $HOME/Movies/"
alias dropbox="cd $HOME/Dropbox/"
alias pictures="cd $HOME/Pictures/"
alias gdrive = "cd $HOME/Google\ Drive/"

# Projects Directory
# ---------------------------------------------------------------------------

alias github="$HOME/Dropbox/GitHub"

# Dev Stuff
# ---------------------------------------------------------------------------

# Jekyll: must be in the same working directory
alias jekyllstart="jekyll serve --watch --baseurl=/"
alias pywebstart="python -m SimpleHTTPServer"

# MongoDB
alias mongostart="mongod --dbpath $HOME/.mongodb-data"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="false"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=10

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby terminalapp zsh-wakatime)

source $ZSH/oh-my-zsh.sh

# Configs
# -----------------------------------------------------------------------------

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Homebrew
export PATH=/usr/local/bin:$PATH

# Make /Applications the default location of apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Thanks for the awesome idea batasrki
function gemdir {
  if [[ -z "$1" ]] ; then
    echo "gemdir expects a parameter, which should be a valid RVM Ruby selector"
  else
    rvm "$1"
    cd $(rvm gemdir)
    pwd
  fi
}

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Boxen
if [[ -d /opt/boxen ]] ; then
  [ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
fi

# Sublime Text
alias subl = "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ."