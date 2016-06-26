#!/usr/bin/sh

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Export PATH after RVM installation
export PATH="/usr/local/bin:/Users/Pongstr/.rvm/gems/ruby-2.1.1@global/bin:$PATH"

# Make /Applications the default location of apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
