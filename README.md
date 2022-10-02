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
> Background photo from [Unsplash Wallpaperss](https://unsplash.com/).

![Showcase](https://i.imgur.com/ErIiC3v.png)

- [Installation](#installation)
  - [Alfred](#alfred)
  - [Chrome](#chrome)
    - [Chrome Extensions](#chrome-extensions)
  - [Desktop](#desktop)
  - [Fonts](#fonts)
  - [Visual Studio Code Editor](#visual-studio-code-editor)
    - [Open with Terminal](#open-with-terminal)
    - [Visual Studio Code Extensions](#visual-studio-code-extensions)
  - [Homebrew](#homebrew)
  - [macOS Apps](#macos-apps)
    - [Casks](#casks)
    - [Manual](#manual)
    - [Menubar](#menubar)
  - [Screensaver](#screensaver)
  - [Shells](#shells)
    - [Hyper](#hyper)
    - [iTerm 2](#iterm-2)
    - [Terminal](#terminal)
- [Usage](#usage)
  - [Tracking](#tracking)
- [Theming](#theming)
- [Contributing](#contributing)
  - [Code of Conduct](#code-of-conduct)
- [Credits](#credits)
  - [Kudos](#kudos)

## Installation

The `sudo` command is necessary for Homebrew to be installed and for some others.

```bash
# Download latest version from Github
curl -L -O https://github.com/FrancesCoronel/dotfiles/archive/5.0.zip

# Unzip the file and move to root
unzip 5.0.zip && mv dotfiles-5.0 .dotfiles && rm 5.0.zip

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

### Alfred

With Alfred, I use a theme called [Materialize](https://www.alfredapp.com/extras/theme/5hT6cEQ6h1/) that is published online for anyone to install through Alfred Themes.

![Alfred](https://i.imgur.com/on1ZDB7.png)

### Chrome

I use a theme I made myself called [Materialize](https://www.themebeta.com/chrome/theme/856926) which anyone can install from [ThemeBeta](https://www.themebeta.com).

![Materialize Chrome Theme](https://i.imgur.com/VwGjdAs.png)

#### Chrome Extensions

- [1Password](https://agilebits.com/onepassword)
- [Adguard AdBlocker](https://chrome.google.com/webstore/detail/bgnkhhnnamicmpeenaelnjfhikgbkllg)
- [Amazon Assistant for Chrome](https://chrome.google.com/webstore/detail/pbjikboenpfhbbejgkoklgkhjpfogcam)
- [Cycle Tab](https://chrome.google.com/webstore/detail/ijhbdahcljlkbhcaagjmhkhdmgamokdl)
- [Enhancer for YouTube](https://chrome.google.com/webstore/detail/ponfpcnoihfmfllpaingbgckeeldkhle)
- [FireShot](https://chrome.google.com/webstore/detail/mcbpblocgmgfnpjjppndjkmgjaogfceg)
- [Fontface Ninja](https://www.fontface.ninja/)
- [GitHunt](http://kamranahmed.info/)
- [GitZip](https://chrome.google.com/webstore/detail/ffabmkklhbepgcgfonabamgnfafbdlkn)
- [Google Inbox Checker](https://chrome.google.com/webstore/detail/ljeebljkookphadpedhmnlokpennimon)
- [Google Keep Chrome Extension](https://chrome.google.com/webstore/detail/lpcaedmchfhocbbapmcbpinfpgnhiddi)
- [Grammarly for Chrome](https://chrome.google.com/webstore/detail/kbfnbcaeplbcioakkpcpgfkobkghlhen)
- [Hova!](https://chrome.google.com/webstore/detail/fmcjcbeolgfldjahlimdijaifioiikeg)
- [Hover Zoom](http://hoverzoom.net/)
- [HoverCards](http://hovercards.com/)
- [I'm a Gentleman](https://chrome.google.com/webstore/detail/afjaicccalbbickikgdegaihmajaidpd)
- [Ink for Google](https://chrome.google.com/webstore/detail/hmanckoiohnlgdommlcckcflkmllobgj)
- [JobHero Sidekick](https://chrome.google.com/webstore/detail/jbghgdobbhngjkngibnbbjpalkoooghb)
- [JSON View](https://chrome.google.com/webstore/detail/chklaanhfefbnpoihckbnefhakgolnmc)
- [Lighthouse](https://chrome.google.com/webstore/detail/blipmdconlkpinefehnmjammfjpmpbjk)
- [Musixmatch Lyrics for YouTube](https://chrome.google.com/webstore/detail/gfenjblodoldnbiddmggcbkcapiolbig)
- [Notifier for GitHub](https://github.com/sindresorhus/notifier-for-github-chrome)
- [OctoMate](https://chrome.google.com/webstore/detail/baggcehellihkglakjnmnhpnjmkbmpkf)
- [Panda 5 | News & Inspiration Dashboard](https://chrome.google.com/webstore/detail/haafibkemckmbknhfkiiniobjpgkebko)
- [Password Alert](https://chrome.google.com/webstore/detail/noondiphcddnnabmjcihcjfbhfklnnep)
- [Pop up blocker for Chrome™ - Poper Blocker](http://www.poperblocker.com/)
- [Product Hunt](https://chrome.google.com/webstore/detail/likjafohlgffamccflcidmedfongmkee)
- [Pushbullet](https://www.pushbullet.com/)
- [Raindrop.io](https://raindrop.io/)
- [Refined GitHub](https://github.com/sindresorhus/refined-github)
- [SimpleExtManager](https://chrome.google.com/webstore/detail/kniehgiejgnnpgojkdhhjbgbllnfkfdk)
- [Sprucemarks](https://chrome.google.com/webstore/detail/fakeocdnmmmnokabaiflppclocckihoj)
- [Stylebot](https://chrome.google.com/webstore/detail/oiaejidbmkiecgbjeifoejpgmdaleoha)
- [WakaTime](https://wakatime.com/)
- [Wappalyzer](https://wappalyzer.com/)
- [Wikiwand](http://www.wikiwand.com/)

### Desktop

I use the [Unsplash Wallpapers](https://unsplash.com/wallpaper) app to automatically generate a new wallpaper every day and the images are so hi-res, it's quite nice.

![Unsplash Wallpapers](https://i.imgur.com/09UZ1ZM.png)

### Fonts

- [Roboto](https://fonts.google.com/specimen/Roboto)
- [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono)
- [Hack](https://github.com/source-foundry/Hack)
- [Input](http://input.fontbureau.com/)

### Visual Studio Code Editor

Using [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) extension with this [Gist](https://gist.github.com/FrancesCoronel/42f14d19392a50ae6fd03feae51ed1de).

#### Open with Terminal

Use `Shell Command: Install 'code' command in PATH`.

![Visual Studio Code](https://i.imgur.com/NBiUCtM.png)

#### Visual Studio Code Extensions

```bash
❯ code --list-extensions | xargs -L 1 echo code --install-extension
```

- `aaron-bond.better-comments`
- `bierner.markdown-preview-github-styles`
- `christian-kohler.npm-intellisense`
- `christian-kohler.path-intellisense`
- `DavidAnson.vscode-markdownlint`
- `dbaeumer.vscode-eslint`
- `dsznajder.es7-react-js-snippets`
- `eamodio.gitlens`
- `ecmel.vscode-html-css`
- `eg2.vscode-npm-script`
- `esbenp.prettier-vscode`
- `eseom.nunjucks-template`
- `formulahendry.auto-close-tag`
- `formulahendry.auto-rename-tag`
- `GitHub.codespaces`
- `GitHub.copilot`
- `GitHub.github-vscode-theme`
- `GitHub.vscode-pull-request-github`
- `jkjustjoshing.vscode-text-pastry`
- `marvhen.reflow-markdown`
- `mdickin.markdown-shortcuts`
- `mgmcdermott.vscode-language-babel`
- `ms-vsliveshare.vsliveshare`
- `naumovs.color-highlight`
- `oderwat.indent-rainbow`
- `Orta.vscode-jest`
- `PKief.material-icon-theme`
- `redhat.vscode-yaml`
- `remimarsal.prettier-now`
- `ritwickdey.LiveServer`
- `Shan.code-settings-sync`
- `streetsidesoftware.code-spell-checker`
- `syler.sass-indented`
- `tehnix.vscode-tidymarkdown`
- `WakaTime.vscode-wakatime`
- `wayou.vscode-todo-highlight`
- `yzhang.markdown-all-in-one`
- `Zignd.html-css-class-completion`

### Homebrew

- [asciinema](https://asciinema.org/)
- [duti](http://duti.org/)
- [git](https://git-scm.com/)
- [git-lfs](https://git-lfs.github.com/)
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
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### macOS Apps

#### Casks

A full list of the apps installed automatically using Homebrew Casks can be found at [`init/.casks`](.init/.casks).

#### Manual

These applications may need to be manually downloaded upon a fresh install.

- [Alfred](https://www.alfredapp.com/)
  - 10x better than Spotlight
- [Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12)
  - Keeps my computer on
- [BetterSnapTool](https://itunes.apple.com/us/app/bettersnaptool/id417375580?mt=12)
  - Easy to drag & resize windows
- [Day One Classic](http://dayoneapp.com/)
  - Personal journal
- [Fantastical](https://flexibits.com/fantastical)
  - A better calendar
- [Kaleidoscope](https://www.kaleidoscopeapp.com/)
  - Dem merge conflicts tho
- [Tower](https://www.git-tower.com/mac/)
  - Best GitHub GUI
- [Tyke](http://tyke.io/)
  - Mac menubar note taker

#### Menubar

![Menubar](https://i.imgur.com/urjOm9B.png?1)

![Bartender Menubar](https://i.imgur.com/RuYsXaW.png?1)

### Screensaver

I use the lovely [Aerial screensaver](https://github.com/JohnCoates/Aerial) which even allows me to have different 3D views on different monitors.

![Aerial](https://cloud.githubusercontent.com/assets/499192/10754100/c0e1cc4c-7c95-11e5-9d3b-842d3acc2fd5.gif)

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

Set up sync folder in Preferences to `~/Dropbox/Code/dotfiles/bin/shell/iterm`.

![iTerm 2](https://i.imgur.com/8XcQqsh.png)

#### Terminal

Import `Materialize.terminal` profile from `~/Dropbox/Code/dotfiles/bin/shell/terminal/Materialize.terminal`.

![Terminal](https://i.imgur.com/kaqt9BC.png)

## Usage

If you decide to utilize these configurations, please make sure to give me some kudos as I have done below with the developers that inspired me. 😊

### Tracking

I use [WakaTime](https://wakatime.com/) with my [API key](https://wakatime.com/api-key) to track all the time spent across different platforms.

For editors, I have the plugin installed. Otherwise, I just use enter the following in the `~/.wakatime.cfg` file.

```text
[settings]
api_key = MY_API_KEY_GOES_HERE
```

## Theming

Accents are as follows in accordance to [Sublime Text 3 Material Theme](https://github.com/equinusocio/material-theme).

![Lime](https://img.shields.io/badge/Lime-%237CB342-lightgrey.svg?colorB=7CB342) ![Purple](https://img.shields.io/badge/Purple-%23AB47BC-lightgrey.svg?colorB=AB47BC) ![Red](https://img.shields.io/badge/Red-%23E57373-lightgrey.svg?colorB=E57373) ![Red Orange](https://img.shields.io/badge/Red_Orange-%23F74A50-lightgrey.svg?colorB=F74A50) ![Orange](https://img.shields.io/badge/Orange-%23FF7042-lightgrey.svg?colorB=FF7042) ![Yellow](https://img.shields.io/badge/Yellow-%23FFA000-lightgrey.svg?colorB=FFA000) ![Indigo](https://img.shields.io/badge/Indigo-%235C6BC0-lightgrey.svg?colorB=5C6BC0) ![Pink](https://img.shields.io/badge/Pink-%23FF4081-lightgrey.svg?colorB=FF4081) ![Blue](https://img.shields.io/badge/Blue-%232979FF-lightgrey.svg?colorB=2979FF) ![Cyan](https://img.shields.io/badge/Cyan-%2300BCD4-lightgrey.svg?colorB=00BCD4)

- Lime

  - `#7CB342`

- Purple

  - `#AB47BC`

- Red

  - `#E57373`

- Red orange

  - `#F74A50`

- Orange

  - `#FF7042`

- Yellow

  - `#FFA000`

- Indigo

  - `#5C6BC0`

- Pink

  - `#FF4081`

- Blue

  - `#2979FF`

- Cyan

  - `#00BCD4`

## Contributing

I'm very open to contributions so please feel free to

1. 🍴 [Fork this repo](https://github.com/FrancesCoronel/dotfiles#fork-destination-box)
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

- [@mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [@necolas](https://github.com/necolas/dotfiles)
- [@cowboy](https://github.com/cowboy/dotfiles/)
- [@ptb](https://github.com/ptb/Mac-OS-X-Lion-Setup)
- [@pongstr](https://twitter.com/pongstr)
- [@sindresorhus](https://github.com/sindresorhus)
- [@equinusocio](https://github.com/equinusocio)
- [@agarrharr](https://github.com/agarrharr)
- [GitHub - `awesome-macOS`](https://github.com/iCHAIT/awesome-macOS)
- [GitHub - `awesome-mac`](https://github.com/jaywcjlove/awesome-mac)
- [Github - `awesome-macos-screensaver`](https://github.com/agarrharr/awesome-macos-screensaver)
- [Shields.io - README Badges](http://shields.io/)
