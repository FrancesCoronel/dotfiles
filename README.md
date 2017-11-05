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

[![GitHub Issues](https://img.shields.io/github/issues/fvcproductions/dotfiles.svg?style=flat-square)](https://github.com/fvcproductions/dotfiles/issues) [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/fvcproductions/dotfiles.svg?style=flat-square)](https://github.com/fvcproductions/dotfiles/pulls) [![MIT License](https://img.shields.io/github/license/fvcproductions/dotfiles.svg?style=flat-square)](http://badges.mit-license.org) [![Become a Patron!](https://img.shields.io/badge/Patreon-Become%20a%20Patron!-orange.svg?style=flat-square)](https://www.patreon.com/fvcproductions)

> This sets up my dev environment to be very Material Design friendly.
>
> Background photo from [Unsplash Wallpapers](https://unsplash.com/).

![Showcase](https://i.imgur.com/0FtAWo2.jpg)

<!-- TOC depthFrom:2 -->

- [Installation](#installation)
  - [Apps](#apps)
    - [Automatic](#automatic)
    - [Manual](#manual)
  - [Chrome](#chrome)
  - [Alfred](#alfred)
  - [Editors](#editors)
    - [Visual Studio Code](#visual-studio-code)
    - [Sublime Text](#sublime-text)
    - [Atom](#atom)
  - [Shells](#shells)
    - [Hyper](#hyper)
    - [iTerm 2](#iterm-2)
    - [Terminal](#terminal)
- [Usage](#usage)
- [Theming](#theming)
- [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
- [Credits](#credits)
  - [Kudos](#kudos)

<!-- /TOC -->

## Installation

The `sudo` command is necessary for Homebrew to be installed and for some others.

```bash
# Download latest version from Github
curl -L -O https://github.com/fvcproductions/dotfiles/archive/4.0.zip

# Unzip the file and move to Dropbox
unzip 4.0.zip && mv dotfiles-4.0 ~/Dropbox/Code/dotfiles

# Run bootstrap!
sh ~/Dropbox/Code/dotfiles/bootstrap.sh

# Installs npm and certain npm packages
sh ~/Dropbox/Code/dotfiles/init/.npm

# Installs casks and taps to caskroom-versions
sh ~/Dropbox/Code/dotfiles/init/.casks

# Installs Sublime Text 3, Package Control, theme, and packages
sh ~/Dropbox/Code/dotfiles/init/.subl

# Installs Atom and Packages
sh ~/Dropbox/Code/dotfiles/init/.atom

# Installs oh-my-zsh, terminal theme, oh-my-zsh theme and configs
sh ~/Dropbox/Code/dotfiles/init/.shell

# Installs optimal macOS system settings
sh ~/Dropbox/Code/dotfiles/init/.osx

# Installs fonts for coding and docs
sh ~/Dropbox/Code/dotfiles/init/.fonts

# Setups git configuration settings
sh ~/Dropbox/Code/dotfiles/init/.gituser
```

### Apps

#### Automatic

A full list of the apps installed automatically using Homebrew Casks can be found at [`init/.casks`](.init/.casks).

- [1Password](https://1password.com/)
- [Adobe Acrobat Reader](https://get.adobe.com/reader/)
- [Adobe Air](https://get.adobe.com/air/)
- [Airtable](https://airtable.com/)
- [Atom](https://atom.io/)
- [Bartender](https://www.macbartender.com/)
- [Between](https://between.us/?lang=en)
- [Caption](https://getcaption.co/)
- [CleanMyMac](https://macpaw.com/cleanmymac)
- [CodeKit](https://codekitapp.com/)
- [Dash](https://kapeli.com/dash)
- [Discord](https://discordapp.com/)
- [Dropbox](https://www.dropbox.com)
- [Flux](https://justgetflux.com/)
- [Franz](https://meetfranz.com/)
- [GitHub Desktop](https://desktop.github.com/)
- [Gitify](https://github.com/manosim/gitify)
- [Google Backup And Sync](https://www.google.com/drive/download/)
- [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html)
- [Google App Engine](https://cloud.google.com/appengine/)
- [Grammarly](https://grammarly.com/)
- [Handbrake](https://handbrake.fr/)
- [Hyper](https://hyper.is/)
- [Image2icon](http://www.img2icnsapp.com/)
- [Join.me](https://www.join.me/)
- [Lepton](http://hackjutsu.com/Lepton/)
- [mac2imgur](https://github.com/mileswd/mac2imgur)
- [Material Colors](https://github.com/romannurik/MaterialColorsApp)
- [Musixmatch](https://www.musixmatch.com/)
- [Muzzle](https://muzzleapp.com/)
- [Quick Look Plugins](https://github.com/sindresorhus/quick-look-plugins)
- [Sketch](https://www.sketchapp.com/)
- [Skype](https://www.skype.com/en/)
- [Spotify](https://www.spotify.com/us/)
- [Steam](http://store.steampowered.com/)
- [Sublime Text](https://www.sublimetext.com/)
- [The Unarchiver](https://theunarchiver.com/)
- [uTorrent](http://www.utorrent.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VLC](https://www.videolan.org/vlc/index.html)
- [YNAB](https://www.youneedabudget.com/)

#### Manual

These applications need to be manually downloaded or transferred from the App Store or Dropbox upon a fresh install.

- [Alfred](https://www.alfredapp.com/)
- [Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12)
- [BetterSnapTool](https://itunes.apple.com/us/app/bettersnaptool/id417375580?mt=12)
- [Blotter](https://itunes.apple.com/us/app/blotter/id406580224?mt=12)
- [BusyCal](https://www.busymac.com/busycal/)
- [Candlelight](https://itunes.apple.com/us/app/candlelight/id655899740?mt=12)
- [Cashew](https://itunes.apple.com/us/app/cashew/id1126100185?mt=12)
- [CodeRunner](https://coderunnerapp.com/)
- [Day One Classic](http://dayoneapp.com/)
- [Gemini](https://macpaw.com/gemini)
- [Fantastical](https://flexibits.com/fantastical)
- [iStat Menus](https://bjango.com/mac/istatmenus/)
- [Kaleidoscope](https://www.kaleidoscopeapp.com/)
- [LittleIpsum](https://itunes.apple.com/us/app/littleipsum/id405772121?mt=12)
- [Living Earth Desktop](http://www.livingearthapp.com/)
- [Marked](http://marked2app.com/)
- [Monodraw](https://monodraw.helftone.com/)
- [Monosnap](https://monosnap.com/welcome)
- [Prepo](https://itunes.apple.com/us/app/prepo/id476533227?mt=12)
- [Promotee](http://www.netwalkapps.com/app/promotee)
- [Redacted](https://itunes.apple.com/us/app/redacted/id984968384?mt=12)
- [Sip](https://sipapp.io/)
- [SiteSucker](http://ricks-apps.com/osx/sitesucker/)
- [Spectrum](http://www.eigenlogik.com/spectrum/mac)
- [Tower](https://www.git-tower.com/mac/)
- [Tyke](http://tyke.io/)
- [Unsplash Wallpaper](https://unsplash.com/wallpaper)
- [Web Snapper](https://www.tastyapps.com/websnapper.html)
- [Yoink](https://eternalstorms.at/yoink/)
- [HemingwayEditor](http://www.hemingwayapp.com/)
- [Fotor Photo Editor](http://www.fotor.com/)
- [Boxy](http://www.boxyapp.co/)

### Chrome

I use a theme I made myself called [Materialize](https://www.themebeta.com/chrome/theme/856926) which anyone can install from [ThemeBeta](https://www.themebeta.com).

![Materialize Chrome Theme](https://i.imgur.com/VwGjdAs.png)

### Alfred

With Alfred, I use a theme called [Materialize](https://www.alfredapp.com/extras/theme/5hT6cEQ6h1/) that is published online for anyone to install through Alfred Themes.

![Alfred](https://i.imgur.com/on1ZDB7.png)

### Editors

#### Visual Studio Code

Using [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) extension with this [Gist](https://gist.github.com/fvcproductions/10a8ad61c7bbd2a618af29a2f7bf05c1).

![Visual Studio Code](https://i.imgur.com/NBiUCtM.png)

#### Sublime Text

Using [SyncSettings](https://github.com/mfuentesg/SyncSettings) package with this [Gist](https://gist.github.com/fvcproductions/6452da691c3a5b37e6b27d2423cb3a26).

![Sublime Text](https://i.imgur.com/JUpBQVU.png)

#### Atom

Using [Sync Settings](https://atom.io/packages/sync-settings) package with this [Gist](https://gist.github.com/fvcproductions/ae1c2069a9ad59e71e321c7f7ba85d53).

![Atom](https://i.imgur.com/JVhDvcq.png)

### Shells

I'm using the oh-my-zsh [pure](https://github.com/sindresorhus/pure) theme.

Once the theme has loaded, you might want to replace the shell's startup command in `Preferences` under `Profiles > Shell Tab`:

`login -fpql fvcproductions /bin/zsh` to `login -fpql YOURNAME /bin/zsh`

#### Hyper

Copy Hyper configuration file to the root folder.

```bash
mv ~Dropbox/Code/dotfiles/bin/shell/hyper/hyper.config.js ~/.hyper.js
```

![Hyper](https://i.imgur.com/Qvej6BG.png)

#### iTerm 2

Set up sync folder in Preferences to `~/Dropbox/Code/dotfiles/bin/shell/iterm`.

![iTerm 2](https://i.imgur.com/8XcQqsh.png)

#### Terminal

Import `Materialize.terminal` profile from `~/Dropbox/Code/dotfiles/bin/shell/terminal/Materialize.terminal`.

![Terminal](https://i.imgur.com/kaqt9BC.png)

## Usage

If you decide to utilize these configurations, please make sure to give me some kudos as I have done below with the developers that inspired me. 😊

## Theming

Accents are as follows in accordance to [Sublime Text 3 Material Theme](https://github.com/equinusocio/material-theme):

- Lime: `#7CB342`
- Purple: `#AB47BC`
- Red: `#E57373`
- Red Orange: `#F74A50`
- Orange: `#FF7042`
- Yellow: `#FFA000`
- Indigo: `#5C6BC0`
- Pink: `#FF4081`
- Blue: `#2979FF`
- Cyan: `#00BCD4`

## Contributing

I'm very open to contributions so please feel free to

1. 🍴 [Fork this repo](https://github.com/fvcproductions/dotfiles#fork-destination-box)
2. 🔨 Follow the [contributing guidelines](CONTRIBUTING.md)
3. 👥 Add yourself as a contributor under the Kudos section
4. 🔧 [Make a pull request](https://github.com/fvcproductions/dotfiles/compare)
5. 🎉 Get your pull request approved - success!

Or just [create an issue](https://github.com/fvcproductions/dotfiles/issues) - any little bit of help counts! 😊

### Code of Conduct

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

More details can be found at this project's [code of conduct](CODE_OF_CONDUCT.md).

## Credits

- [FVCproductions](https://github.com/fvcproductions) 🍓🍫

### Kudos

- README Badges from [Shields.io](http://shields.io/)
- [@mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [@necolas](https://github.com/necolas/dotfiles)
- [@cowboy](https://github.com/cowboy/dotfiles/)
- [@ptb](https://github.com/ptb/Mac-OS-X-Lion-Setup)
- [@pongstr](https://twitter.com/pongstr)
- [@sindresorhus](https://github.com/sindresorhus)
- [@equinusocio](https://github.com/equinusocio)