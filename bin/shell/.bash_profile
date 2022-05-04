#!/usr/bin/sh

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Make /Applications the default location of apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Load RVM into a shell sessio#n *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
