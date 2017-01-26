#!/usr/bin/env bash

echo "
 ******** **      **   ******
/**///// /**     /**  **////**
/**      /**     /** **    //
/******* //**    ** /**
/**////   //**  **  /**
/**        //****   //**    **
/**         //**     //******
//           //       //////

+-+-+-+-+-+-+-+-+
|D|o|t|f|i|l|e|s|
+-+-+-+-+-+-+-+-+

https://github.com/fvcproductions/dotfiles.git
"

# downloading Apple Dev Tools
echo ""
echo "  To run this, you must download & install the latest Xcode and Command Line Tools"
echo "    > https://developer.apple.com/xcode/"
echo "    > https://developer.apple.com/downloads/"

xcode-select --install

# function to check if a package exists
check () { type -t "${@}" > /dev/null 2>&1; }

# function to install Homebrew Formulas
install_formula () {
  DOTFILE=$(pwd)

  echo ""
  echo "Installing Homebrew Packages:"

  echo ""
  echo "  ➜ git"
  brew install git

  echo ""
  echo "  ➜ mongodb"
  brew install mongo
  mkdir $HOME/.mongodb-data

  echo ""
  echo "  ➜ nginx"
  brew install nginx

  echo ""
  echo "  ➜ node"
  brew install node

  echo ""
  echo "  ➜ openssl"
  brew install openssl

  echo ""
  echo "  ➜ python"
  brew install python

  echo ""
  echo "  ➜ zsh"
  brew install zsh

  echo ""
  echo "  ➜ youtube-dl"
  brew install youtube-dl

  echo ""
  echo "  ➜ libav"
  brew install libav

  echo ""
  echo "  ➜ duti"
  brew install duti

  # cleanup
  echo ""
  echo "Cleaning up Homebrew installation..."
  brew cleanup

  yes | cp -rf $DOTFILE/bin/shell/.bashrc $HOME/.bashrc
  yes | cp -rf $DOTFILE/bin/shell/.bash_alias $HOME/.bash_alias
  yes | cp -rf $DOTFILE/bin/shell/.bash_profile $HOME/.bash_profile

  echo "Installing Caskroom, Caskroom versions, Caskroom Fonts and Brew Services"
  brew install caskroom/cask/brew-cask
  brew tap homebrew/services
  brew tap caskroom/versions
  brew tap caskroom/fonts

  # Make /Applications the default location of installed Homebrew casks
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

}

# install Hushlogin
echo ""
echo "Install hushlogin"
echo "  - Disable the system copyright notice, the date and time of the last login."
echo "    more info at @mathiasbynens/dotfiles http://goo.gl/wZBM80"
echo ""
yes | cp -rf "$DOTFILE/.hushlogin" $HOME/.hushlogin
touch .hushlogin

# install Homebrew
echo ""
echo "Checking if Homebrew is installed..."

if check brew; then
  echo "Awesome! Homebrew is installed! Now updating..."
  echo ""
  brew upgrade
  brew update --all
fi

if ! check brew; then
  echo "Download and install homebrew"
  echo ""
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # run Brew doctor before anything else
  brew doctor
fi

# install Homebrew Formulas
while true; do
  read -p "Would you like to install Homebrew formulas? [y/n] " answer
  echo ""
  case $answer in
    [y/Y]* ) install_formula; break;;
    [n/N]* ) break;;
    * ) echo "Please answer Y or N.";;
  esac
done

# restart terminal to apply changes
echo ""
echo "bootstrapping complete! quitting terminal..."
killall Terminal