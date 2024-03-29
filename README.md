```txt
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
```

# Dotfiles

[![GitHub Issues](https://img.shields.io/github/issues/FrancesCoronel/dotfiles.svg?style=flat-square)](https://github.com/FrancesCoronel/dotfiles/issues) [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/FrancesCoronel/dotfiles.svg?style=flat-square)](https://github.com/FrancesCoronel/dotfiles/pulls) [![MIT License](https://img.shields.io/github/license/FrancesCoronel/dotfiles.svg?style=flat-square)](http://badges.mit-license.org)

> This sets up my dev environment to be very Material Design friendly.
>
> Background photo from [Unsplash](https://unsplash.com/).

![Showcase](https://i.imgur.com/CSfpCwp.png)

- [Installation](#installation)
- [Customizations](#customizations)
  - [Alfred](#alfred)
  - [Chrome](#chrome)
  - [Desktop](#desktop)
  - [Fonts](#fonts)
  - [Homebrew](#homebrew)
  - [Screensaver](#screensaver)
  - [Shells](#shells)
    - [Hyper](#hyper)
    - [iTerm 2](#iterm-2)
    - [Terminal](#terminal)
    - [Warp (Primary)](#warp-primary)
  - [Tracking](#tracking)
  - [Visual Studio Code Editor](#visual-studio-code-editor)
    - [Code Command in Path](#code-command-in-path)
    - [Visual Studio Code Extensions](#visual-studio-code-extensions)
- [Theming](#theming)
- [Usage](#usage)
- [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
- [Credits](#credits)
  - [Kudos](#kudos)

## Installation

The `sudo` command is necessary for Homebrew to be installed and for some others.

```bash
# Download latest version from Github
curl -L -O https://github.com/FrancesCoronel/dotfiles/archive/9.0.zip

# Unzip the file and move to root
unzip 9.0.zip
mv dotfiles-9.0 .dotfiles
rm 9.0.zip

# Run bootstrap!
sh ~/.dotfiles/bootstrap.sh

# Installs npm and certain npm packages
sh ~/.dotfiles/init/.npm

# Installs casks and taps to caskroom-versions
sh ~/.dotfiles/init/.casks

# Installs oh-my-zsh, terminal theme, oh-my-zsh theme and configs
sh ~/.dotfiles/init/.shell

# Installs optimal macOS system settings
sh ~/.dotfiles/init/.osx

# Installs fonts for coding and docs
sh ~/.dotfiles/init/.fonts

# Setups git configuration settings
sh ~/.dotfiles/init/.gituser
```

## Customizations

### Alfred

With Alfred, I use a theme called [Materialize](https://www.alfredapp.com/extras/theme/5hT6cEQ6h1/) that is published online for anyone to install through Alfred Themes.

### Chrome

My Chrome theme and extensions are automatically synced via my Google account.

### Desktop

I use the [Irvue](https://leonspok.com/irvue/landing/) app to automatically generate a new wallpaper every day and the images are so hi-res, it's quite nice.

![Unsplash Wallpapers](https://leonspok.com/irvue/landing/resources/macbook_pro.png)

### Fonts

- [Hack](https://github.com/source-foundry/Hack)
- [Input](http://input.fontbureau.com/)
- [Latina Essential](https://www.behance.net/gallery/51912641/Latina-Essential-Free?locale=en_US)
- [MesloLGS](https://github.com/andreberg/Meslo-Font)
- [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono)
- [Roboto](https://fonts.google.com/specimen/Roboto)

### Homebrew

These are listed in `bootstrap.sh`.

- [asciinema](https://asciinema.org/)
- [duti](http://duti.org/)
- [git-lfs](https://git-lfs.github.com/)
- [git](https://git-scm.com/)
- [howdoi](https://github.com/gleitz/howdoi)
- [hugo](https://gohugo.io/)
- [libav](https://www.libav.org/)
- [nginx](https://www.nginx.com/)
- [node](https://nodejs.org)
- [now](https://zeit.co/now)
- [openssl](https://www.openssl.org/)
- [pandoc](https://pandoc.org/index.html)
- [python](https://www.python.org/)
- [yarn](https://yarnpkg.com/en/)
- [youtube-dl](https://rg3.github.io/youtube-dl/)
- [zsh](http://www.zsh.org/)

### Screensaver

I use the lovely [Aerial screensaver](https://github.com/JohnCoates/Aerial) which even allows me to have different 3D views on different monitors.

![Aerial](https://aerialscreensaver.github.io/img/macbookpro-aerial.png)

### Shells

I'm using the oh-my-zsh [pure](https://github.com/sindresorhus/pure) theme.

Once the theme has loaded, you might want to replace the shell's startup command in `Preferences` under `Profiles > Shell Tab`:

`login -fpql FrancesCoronel /bin/zsh` to `login -fpql YOURNAME /bin/zsh`

#### Hyper

Copy Hyper configuration file to the root folder.

```bash
mv ~Dropbox/Code/dotfiles/bin/shell/hyper/hyper.config.js ~/.hyper.js
```

![Hyper](https://i.imgur.com/Qvej6BG.png)

#### iTerm 2

Set up sync folder in Preferences to `~/Dropbox/Code/dotfiles/bin/shell/iterm` under `General > Preferences`.

![iTerm 2](https://i.imgur.com/8XcQqsh.png)

#### Terminal

Import `Materialize.terminal` profile from `~/Dropbox/Code/dotfiles/bin/shell/terminal/Materialize.terminal`.

![Terminal](https://i.imgur.com/kaqt9BC.png)

#### Warp (Primary)

Don't have to do anything here except sign in after you install it.

![Warp](https://i.imgur.com/EGSii5Y.png)

### Tracking

I use [WakaTime](https://wakatime.com/) with my [API key](https://wakatime.com/api-key) to track all the time spent across different platforms.

For editors, I have the plugin installed. Otherwise, I just use enter the following in the `~/.wakatime.cfg` file.

```text
[settings]
api_key = MY_API_KEY_GOES_HERE
```

### Visual Studio Code Editor

I use Settings Sync to manage everything related to VS Code.

#### Code Command in Path

Manually use `Shell Command: Install 'code' command in PATH`.

![Visual Studio Code](https://i.imgur.com/NBiUCtM.png)

#### Visual Studio Code Extensions

These are synced via Settings Sync automatically.

The command below lists all extensions.

```bash
❯ code --list-extensions | xargs -L 1 echo code --install-extension
```

## Theming

Accents are as follows in accordance to [Sublime Text 3 Material Theme](https://github.com/equinusocio/material-theme).

![Blue](https://img.shields.io/badge/Blue-%232979FF-lightgrey.svg?colorB=2979FF)
![Cyan](https://img.shields.io/badge/Cyan-%2300BCD4-lightgrey.svg?colorB=00BCD4)
![Indigo](https://img.shields.io/badge/Indigo-%235C6BC0-lightgrey.svg?colorB=5C6BC0)
![Lime](https://img.shields.io/badge/Lime-%237CB342-lightgrey.svg?colorB=7CB342)
![Orange](https://img.shields.io/badge/Orange-%23FF7042-lightgrey.svg?colorB=FF7042)
![Pink](https://img.shields.io/badge/Pink-%23FF4081-lightgrey.svg?colorB=FF4081)
![Purple](https://img.shields.io/badge/Purple-%23AB47BC-lightgrey.svg?colorB=AB47BC)
![Red Orange](https://img.shields.io/badge/Red_Orange-%23F74A50-lightgrey.svg?colorB=F74A50)
![Red](https://img.shields.io/badge/Red-%23E57373-lightgrey.svg?colorB=E57373)
![Yellow](https://img.shields.io/badge/Yellow-%23FFA000-lightgrey.svg?colorB=FFA000)

## Usage

If you decide to utilize these configurations, please make sure to give me some kudos as I have done below with the developers that inspired me. 😊

## Contributing

I'm very open to contributions so please feel free to

1. 🍴 [Fork this repo](https://github.com/FrancesCoronel/dotfiles/fork)
2. 🔨 Follow the [contributing guidelines](CONTRIBUTING.md)
3. 👥 Add yourself as a contributor under the Kudos section
4. 🔧 [Make a pull request](https://github.com/FrancesCoronel/dotfiles/compare)
5. 🎉 Get your pull request approved - success!

Or just [create an issue](https://github.com/FrancesCoronel/dotfiles/issues) - any little bit of help counts! 😊

### Code of Conduct

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

More details can be found at this project's [code of conduct](CODE_OF_CONDUCT.md).

## Credits

- [Frances Coronel](https://github.com/FrancesCoronel) 🍓🍫

### Kudos

- [@agarrharr](https://github.com/agarrharr)
- [@cowboy](https://github.com/cowboy/dotfiles/)
- [@equinusocio](https://github.com/equinusocio)
- [@mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [@necolas](https://github.com/necolas/dotfiles)
- [@pongstr](https://twitter.com/pongstr)
- [@ptb](https://github.com/ptb/Mac-OS-X-Lion-Setup)
- [@sindresorhus](https://github.com/sindresorhus)
- [GitHub - `awesome-mac`](https://github.com/jaywcjlove/awesome-mac)
- [Github - `awesome-macos-screensaver`](https://github.com/agarrharr/awesome-macos-screensaver)
- [GitHub - `awesome-macOS`](https://github.com/iCHAIT/awesome-macOS)
- [Shields.io - README Badges](http://shields.io/)
