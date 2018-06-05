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

[![GitHub Issues](https://img.shields.io/github/issues/fvcproductions/dotfiles.svg?style=flat-square)](https://github.com/fvcproductions/dotfiles/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/fvcproductions/dotfiles.svg?style=flat-square)](https://github.com/fvcproductions/dotfiles/pulls)
[![MIT License](https://img.shields.io/github/license/fvcproductions/dotfiles.svg?style=flat-square)](http://badges.mit-license.org)
[![Become a Patron!](https://img.shields.io/badge/Patreon-Become%20a%20Patron!-orange.svg?style=flat-square)](https://www.patreon.com/fvcproductions)

> This sets up my dev environment to be very Material Design friendly.
>
> Background photo from [Unsplash Wallpaperss](https://unsplash.com/).

![Showcase](https://i.imgur.com/0FtAWo2.jpg)

<!-- TOC -->

- [Dotfiles](#dotfiles)
  - [Installation](#installation)
    - [Alfred](#alfred)
    - [Chrome](#chrome)
      - [Extensions](#extensions)
    - [Desktop](#desktop)
    - [Fonts](#fonts)
    - [Editors](#editors)
      - [Atom](#atom)
      - [Sublime Text](#sublime-text)
      - [Visual Studio Code](#visual-studio-code)
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

<!-- /TOC -->

## Installation

The `sudo` command is necessary for Homebrew to be installed and for some
others.

```bash
# Download latest version from Github
curl -L -O https://github.com/fvcproductions/dotfiles/archive/4.0.zip

# Unzip the file and move to root
unzip 4.0.zip && mv dotfiles-4.0 ~/dotfiles

# Run bootstrap!
sh ~/Dropbox/Code/dotfiles/bootstrap.sh

# Installs npm and certain npm packages
sh ~/Dropbox/Code/dotfiles/init/.npm

# Installs casks and taps to caskroom-versions
sh ~/Dropbox/Code/dotfiles/init/.casks

# Installs oh-my-zsh, terminal theme, oh-my-zsh theme and configs
sh ~/Dropbox/Code/dotfiles/init/.shell

# Installs optimal macOS system settings
sh ~/Dropbox/Code/dotfiles/init/.osx

# Installs fonts for coding and docs
sh ~/Dropbox/Code/dotfiles/init/.fonts

# Setups git configuration settings
sh ~/Dropbox/Code/dotfiles/init/.gituser
```

### Alfred

With Alfred, I use a theme called
[Materialize](https://www.alfredapp.com/extras/theme/5hT6cEQ6h1/) that is
published online for anyone to install through Alfred Themes.

![Alfred](https://i.imgur.com/on1ZDB7.png)

### Chrome

I use a theme I made myself called
[Materialize](https://www.themebeta.com/chrome/theme/856926) which anyone can
install from [ThemeBeta](https://www.themebeta.com).

![Materialize Chrome Theme](https://i.imgur.com/VwGjdAs.png)

#### Extensions

- [1Password](https://agilebits.com/onepassword)
- [Adguard AdBlocker](https://chrome.google.com/webstore/detail/bgnkhhnnamicmpeenaelnjfhikgbkllg)
- [Amazon Assistant for Chrome](https://chrome.google.com/webstore/detail/pbjikboenpfhbbejgkoklgkhjpfogcam)
- [Cycle Tab](https://chrome.google.com/webstore/detail/ijhbdahcljlkbhcaagjmhkhdmgamokdl)
  - Now I have multiple new tab extensions I can peruse!
- [Enhancer for YouTube](https://chrome.google.com/webstore/detail/ponfpcnoihfmfllpaingbgckeeldkhle)
- [FireShot](https://chrome.google.com/webstore/detail/mcbpblocgmgfnpjjppndjkmgjaogfceg)
- [Fontface Ninja](https://www.fontface.ninja/)
- [GitHunt](http://kamranahmed.info/)
- [GitZip](https://chrome.google.com/webstore/detail/ffabmkklhbepgcgfonabamgnfafbdlkn)
- [Google Inbox Checker](https://chrome.google.com/webstore/detail/ljeebljkookphadpedhmnlokpennimon)
- [Google Keep Chrome Extension](https://chrome.google.com/webstore/detail/lpcaedmchfhocbbapmcbpinfpgnhiddi)
- [Grammarly for Chrome](https://chrome.google.com/webstore/detail/kbfnbcaeplbcioakkpcpgfkobkghlhen)
- [Hova!](https://chrome.google.com/webstore/detail/fmcjcbeolgfldjahlimdijaifioiikeg)
  - People always notice the Jay Z cursor - lol.
- [Hover Zoom](http://hoverzoom.net/)
- [HoverCards](http://hovercards.com/)
- [I'm a Gentleman](https://chrome.google.com/webstore/detail/afjaicccalbbickikgdegaihmajaidpd)
  - So easy to download images!
- [Ink for Google](https://chrome.google.com/webstore/detail/hmanckoiohnlgdommlcckcflkmllobgj)
  - Ey, Material!
- [JobHero Sidekick](https://chrome.google.com/webstore/detail/jbghgdobbhngjkngibnbbjpalkoooghb)
  - If you're applying to jobs, this is a must-have!
- [JSON View](https://chrome.google.com/webstore/detail/chklaanhfefbnpoihckbnefhakgolnmc)
- [Lighthouse](https://chrome.google.com/webstore/detail/blipmdconlkpinefehnmjammfjpmpbjk)
  - This is embedded into DevTools already but it's kinda faster to just click
    the extension - lol.
- [Musixmatch Lyrics for YouTube](https://chrome.google.com/webstore/detail/gfenjblodoldnbiddmggcbkcapiolbig)
  - Lyrics everywhere!
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

I use the [Unsplash Wallpapers](https://unsplash.com/wallpaper) app to
automatically generate a new wallpaper every day and the images are so hi-res,
it's quite nice.

![Unsplash Wallpapers](https://i.imgur.com/09UZ1ZM.png)

### Fonts

- [Roboto](https://fonts.google.com/specimen/Roboto)
- [Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono)
- [Hack](https://github.com/source-foundry/Hack)
- [Input](http://input.fontbureau.com/)

### Editors

#### Atom

Using [Sync Settings](https://atom.io/packages/sync-settings) package with this
[Gist](https://gist.github.com/fvcproductions/ae1c2069a9ad59e71e321c7f7ba85d53).

![Atom](https://i.imgur.com/JVhDvcq.png)

#### Sublime Text

Using [SyncSettings](https://github.com/mfuentesg/SyncSettings) package with
this
[Gist](https://gist.github.com/fvcproductions/6452da691c3a5b37e6b27d2423cb3a26).

![Sublime Text](https://i.imgur.com/JUpBQVU.png)

#### Visual Studio Code

Using
[Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
extension with this
[Gist](https://gist.github.com/fvcproductions/10a8ad61c7bbd2a618af29a2f7bf05c1).

![Visual Studio Code](https://i.imgur.com/NBiUCtM.png)

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

A full list of the apps installed automatically using Homebrew Casks can be
found at [`init/.casks`](.init/.casks).

- [1Password](https://1password.com/)
  - To easily manage all my passwords
- [Adobe Acrobat Reader](https://get.adobe.com/reader/)
  - Ehhhh... just a backup.
- [Adobe Air](https://get.adobe.com/air/)
  - Gaming reasons.
- [Airtable](https://airtable.com/)
  - much nicer than Google Sheets or Excel
- [Atom](https://atom.io/)
  - I still love ST3 but Atom is open-source and created by GitHub soo.... at
    this point I'm just waiting for Atom to be a shit ton faster
- [Audacity](http://www.audacityteam.org/)
  - To edit audio recordings
- [Bartender](https://www.macbartender.com/)
  - I have too many apps in my menubar.
- [Between](https://between.us/?lang=en)
  - I wanted a personal space for my bae & I <3.
- [Caption](https://getcaption.co/)
  - Gets my subtitles right every time!
- [CleanMyMac](https://macpaw.com/cleanmymac)
  - For easy cleaning
- [CodeKit](https://codekitapp.com/)
  - For serving very small static web projects
- [Dash](https://kapeli.com/dash)
  - Code snippets everywhere!
- [Discord](https://discordapp.com/)
  - Super reliable for being a gaming communication platform.
- [Dropbox](https://www.dropbox.com)
  - Store all the things!
  - Also, iCloud is kinda shitty.
  - Also, I only have 15GB of Google Drive space.
- [Flux](https://justgetflux.com/)
  - I work at night...
- [Franz](https://meetfranz.com/)
  - Multiple chat channels in one app
    - Discord
    - Gitter
    - Google Hangouts
    - Inbox
    - LinkedIn
    - Slack
      - FastVoted
      - RSS Feeds
    - Steam Chat
    - TweetDeck
    - WhatsApp
- [GitHub Desktop](https://desktop.github.com/)
  - I use Tower instead now but yeah sure.
- [Gitify](https://github.com/manosim/gitify)
  - To get notified about issues on GitHub
- [Google Backup And Sync](https://www.google.com/drive/download/)
  - Dat Google tho.
- [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html)
  - Cause duh.
- [Google App Engine](https://cloud.google.com/appengine/)
- [Grammarly](https://grammarly.com/)
- [Handbrake](https://handbrake.fr/)
  - Easily compress videos
- [Hyper](https://hyper.is/)
  - A cool ass looking Terminal
- [Image2icon](http://www.img2icnsapp.com/)
  - Create cool icon assets
- [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
  - I get that one error sometimes where my computer tells me "Install Java or
    else!" so I comply.
- [Join.me](https://www.join.me/)
- [Lepton](http://hackjutsu.com/Lepton/)
  - Manage GitHub Gists
- [mac2imgur](https://github.com/mileswd/mac2imgur)
  - Easily upload images to imgur
- [Material Colors](https://github.com/romannurik/MaterialColorsApp)
- [Musixmatch](https://www.musixmatch.com/)
- [Muzzle](https://muzzleapp.com/)
- [Quick Look Plugins](https://github.com/sindresorhus/quick-look-plugins)
- [Sketch](https://www.sketchapp.com/)
- [Skype](https://www.skype.com/en/)
- [Spotify](https://www.spotify.com/us/)
- [Steam](http://store.steampowered.com/)
- [Sublime Text](https://www.sublimetext.com/)
  - My past all-time favorite text editor - now it's VS Code
- [The Unarchiver](https://theunarchiver.com/)
  - Because the default zip utility app is kinda shitty sometimes?
- [uTorrent](http://www.utorrent.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
  - It has so many amazing features that help with serious JS development.
- [VLC](https://www.videolan.org/vlc/index.html)

#### Manual

These applications need to be manually downloaded or transferred from the App
Store or Dropbox upon a fresh install.

- [Alfred](https://www.alfredapp.com/)
  - 10x better than Spotlight
- [Amphetamine](https://itunes.apple.com/us/app/amphetamine/id937984704?mt=12)
  - Slightly better than the Caffeine app
- [BetterSnapTool](https://itunes.apple.com/us/app/bettersnaptool/id417375580?mt=12)
  - Easy to drag & resize windows
- [Blotter](https://itunes.apple.com/us/app/blotter/id406580224?mt=12)
- [Boxy](http://www.boxyapp.co/)
- [BusyCal](https://www.busymac.com/busycal/)
- [Candlelight](https://itunes.apple.com/us/app/candlelight/id655899740?mt=12)
- [Cashew](https://itunes.apple.com/us/app/cashew/id1126100185?mt=12)
- [Craft by InVision](https://www.invisionapp.com/craft)
  - Great add on for features in Sketch
- [CodeRunner](https://coderunnerapp.com/)
  - Running small code snippets but yeah, there's also
    [`repl.it`](https://repl.it/)
- [Day One Classic](http://dayoneapp.com/)
  - Personal journal
- [Gemini](https://macpaw.com/gemini)
- [Fantastical](https://flexibits.com/fantastical)
- [Fotor Photo Editor](http://www.fotor.com/)
- [HemingwayEditor](http://www.hemingwayapp.com/)
- [iStat Menus](https://bjango.com/mac/istatmenus/)
- [Kaleidoscope](https://www.kaleidoscopeapp.com/)
  - Dem merge conflicts tho
- [LittleIpsum](https://itunes.apple.com/us/app/littleipsum/id405772121?mt=12)
- [Living Earth Desktop](http://www.livingearthapp.com/)
- [Marked](http://marked2app.com/)
  - Preview Markdown files with tons of features/options
- [Monodraw](https://monodraw.helftone.com/)
- [Monosnap](https://monosnap.com/welcome)
  - Easily share video recordings
- [Prepo](https://itunes.apple.com/us/app/prepo/id476533227?mt=12)
- [Promotee](http://www.netwalkapps.com/app/promotee)
  - To showcase apps off
- [Redacted](https://itunes.apple.com/us/app/redacted/id984968384?mt=12)
- [Sip](https://sipapp.io/)
  - Cool color manager
- [SiteSucker](http://ricks-apps.com/osx/sitesucker/)
- [Spectrum](http://www.eigenlogik.com/spectrum/mac)
- [Squash](https://www.realmacsoftware.com/squash/)
- [Tower](https://www.git-tower.com/mac/)
  - Best GitHub GUI right now
- [Tyke](http://tyke.io/)
- [Unsplash Wallpapers](https://unsplash.com/wallpaper)
- [Web Snapper](https://www.tastyapps.com/websnapper.html)
- [Yoink](https://eternalstorms.at/yoink/)
- [YNAB](https://www.youneedabudget.com/)
  - Manage some moneys

#### Menubar

> Just for future reference.

![Menubar](https://i.imgur.com/urjOm9B.png?1)

![Bartender Menubar](https://i.imgur.com/RuYsXaW.png?1)

### Screensaver

I use the lovely [Aerial screensaver](shttps://github.com/JohnCoates/Aerial)
which even allows me to have different 3D views on different monitors.

![Aerial](https://cloud.githubusercontent.com/assets/499192/10754100/c0e1cc4c-7c95-11e5-9d3b-842d3acc2fd5.gif)

### Shells

I'm using the oh-my-zsh [pure](https://github.com/sindresorhus/pure) theme.

Once the theme has loaded, you might want to replace the shell's startup command
in `Preferences` under `Profiles > Shell Tab`:

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

Import `Materialize.terminal` profile from
`~/Dropbox/Code/dotfiles/bin/shell/terminal/Materialize.terminal`.

![Terminal](https://i.imgur.com/kaqt9BC.png)

## Usage

If you decide to utilize these configurations, please make sure to give me some
kudos as I have done below with the developers that inspired me. 😊

### Tracking

I use [WakaTime](https://wakatime.com/) to track all the time spent across
different platforms.

For editors, I have the plugin installed. Otherwise, I just use enter the
following in the `~/.wakatime.cfg` file.

```text
[settings]
api_key = MY_API_KEY_GOES_HERE
```

For Sketch, I also take the following steps.

```bash
cd ~/Library/Application Support/com.bohemiancoding.sketch3
# remove Plugins folder
rm -r Plugins
# create alias with existing User folder
ln -s /Users/fvcproductions/Dropbox/Code/dotfiles/bin/sketch/Plugins
```

## Theming

Accents are as follows in accordance to
[Sublime Text 3 Material Theme](https://github.com/equinusocio/material-theme).

![Lime](https://img.shields.io/badge/Lime-%237CB342-lightgrey.svg?colorB=7CB342)
![Purple](https://img.shields.io/badge/Purple-%23AB47BC-lightgrey.svg?colorB=AB47BC)
![Red](https://img.shields.io/badge/Red-%23E57373-lightgrey.svg?colorB=E57373)
![Red Orange](https://img.shields.io/badge/Red_Orange-%23F74A50-lightgrey.svg?colorB=F74A50)
![Orange](https://img.shields.io/badge/Orange-%23FF7042-lightgrey.svg?colorB=FF7042)
![Yellow](https://img.shields.io/badge/Yellow-%23FFA000-lightgrey.svg?colorB=FFA000)
![Indigo](https://img.shields.io/badge/Indigo-%235C6BC0-lightgrey.svg?colorB=5C6BC0)
![Pink](https://img.shields.io/badge/Pink-%23FF4081-lightgrey.svg?colorB=FF4081)
![Blue](https://img.shields.io/badge/Blue-%232979FF-lightgrey.svg?colorB=2979FF)
![Cyan](https://img.shields.io/badge/Cyan-%2300BCD4-lightgrey.svg?colorB=00BCD4)

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

1.  🍴
    [Fork this repo](https://github.com/fvcproductions/dotfiles#fork-destination-box)
2.  🔨 Follow the [contributing guidelines](CONTRIBUTING.md)
3.  👥 Add yourself as a contributor under the Kudos section
4.  🔧 [Make a pull request](https://github.com/fvcproductions/dotfiles/compare)
5.  🎉 Get your pull request approved - success!

Or just [create an issue](https://github.com/fvcproductions/dotfiles/issues) -
any little bit of help counts! 😊

### Code of Conduct

In the interest of fostering an open and welcoming environment, we as
contributors and maintainers pledge to making participation in our project and
our community a harassment-free experience for everyone, regardless of age, body
size, disability, ethnicity, gender identity and expression, level of
experience, nationality, personal appearance, race, religion, or sexual identity
and orientation.

More details can be found at this project's
[code of conduct](CODE_OF_CONDUCT.md).

## Credits

- [FVCproductions](https://github.com/fvcproductions) 🍓🍫

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
