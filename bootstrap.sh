#!/usr/bin/env bash
# The full color palette is kept for reuse, so not every color is used.
# shellcheck disable=SC2034

# Homebrew asks to confirm every install that pulls in dependencies; skip that
export HOMEBREW_NO_ASK=1

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BRORANGE='\033[0;33m' # brown/orange
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LGRAY='\033[0;37m' # light gray

DGRAY='\033[1;30m' # dark gray
LRED='\033[1;31m' # light red
LGREEN='\033[1;32m' # light green
YELLOW='\033[1;33m'
LBLUE='\033[1;34m' # light blue
LPURPLE='\033[1;35m' # light purple
LCYAN='\033[1;36m' # light cyan
WHITE='\033[1;37m'

NC='\033[0m' # No Color

# Dotfiles directory

DOTFILES="$HOME/.dotfiles"

# Intro message

echo "${CYAN}
 ******** **      **   ******
/**///// /**     /**  **////**
/**      /**     /** **    //
/******* //**    ** /**
/**////   //**  **  /**
/**        //****   //**    **
/**         //**     //******
//           //       //////
${LGREEN}
+-+-+-+-+-+-+-+-+
|D|o|t|f|i|l|e|s|
+-+-+-+-+-+-+-+-+
${WHITE}
https://github.com/FrancesCoronel/dotfiles.git
${NC}
"

# downloading Apple Dev Tools
echo "${LGREEN}To run this, you must download & install the latest Xcode and Command Line Tools${NC}"
echo "    > https://developer.apple.com/xcode/"
echo "    > https://developer.apple.com/downloads/"

xcode-select -p > /dev/null 2>&1 || xcode-select --install

# function to check if a package exists
check () { type -t "${@}" > /dev/null 2>&1; }

# Homebrew lives in /opt/homebrew on Apple Silicon and /usr/local on Intel,
# and /opt/homebrew is not on the PATH of a new Mac
load_brew () {
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

# function to install Homebrew Formulas
install_formula () {
  echo ""
  echo "${LGREEN}Installing Homebrew Packages...${NC}"

  brew install asciinema
  brew install duti
  brew install eza
  brew install gh
  brew install git
  brew install git-lfs
  brew install howdoi
  brew install hugo
  brew install ffmpeg
  brew install nginx
  brew install node
  brew install openssl
  brew install pandoc
  brew install python
  brew install starship
  brew install yarn
  brew install yt-dlp
  brew install zsh

  # cleanup
  echo ""
  echo "${LGREEN}Cleaning up Homebrew installation...${NC}"
  brew cleanup

  cp -rf "${DOTFILES}/config/shell/.bashrc" "$HOME/.bashrc"
  cp -rf "${DOTFILES}/config/shell/.bash_aliases" "$HOME/.bash_aliases"
  cp -rf "${DOTFILES}/config/shell/.bash_profile" "$HOME/.bash_profile"

  # restart terminal to apply changes
  echo "✔ ✔ ✔ ✔ ✔
  ${LGREEN}Bootstrapping complete!
  ✔ ✔ ✔ ✔ ✔${NC}"
  echo "Quitting terminal now...${NC}"

  # Make /Applications the default location of installed Homebrew casks
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  killall Terminal
}

# no problem
no_homebrew () {
  echo "${CYAN}Okay no problem, you can move on to the next step now.${NC}"
}

# install Hushlogin
echo ""
echo "${LGREEN}Installing hushlogin...${NC}"
echo "Disabling the system copyright notice, the date and time of the last login."
echo "More info at https://github.com/FrancesCoronel/dotfiles/blob/master/init/.hushlogin"
echo ""
cp -rf "${DOTFILES}/init/.hushlogin" "$HOME/.hushlogin"
touch .hushlogin

# install Homebrew
echo ""
echo "${LGREEN}Checking if Homebrew is installed...${NC}"

load_brew

if check brew; then
  echo ""
  echo "${YELLOW}Awesome! Homebrew is installed! Now updating...${NC}"
  echo ""
  brew upgrade
  brew update
fi

if ! check brew; then
  echo "${LGREEN}Downloading and install homebrew${NC}"
  echo ""
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  load_brew

  # run Brew doctor before anything else
  brew doctor
fi

# put Homebrew on the PATH of new terminals, so the init scripts can find it
cp -f "${DOTFILES}/config/shell/.zprofile" "$HOME/.zprofile"

# install Homebrew Formulas
while true; do
  read -r -p "Would you like to install Homebrew formulas? [y/n]" answer
  echo "${NC}"
  case $answer in
    [y/Y]* ) install_formula; break;;
    [n/N]* ) no_homebrew; break;;
    * ) echo "${RED}Please answer Y or N.${NC}";;
  esac
done
