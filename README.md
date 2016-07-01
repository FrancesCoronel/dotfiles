# Dotfiles

This sets up my dev environment to be very Material Design friendly.

> [@fvcproductions](http://twitter.com/fvcproductions)

### Requirements

**[Xcode](https://developer.apple.com/xcode/)** &amp; **[Command Line Tools](https://developer.apple.com/downloads)**

> `sudo` is necessary for Homebrew to be installed and for some others. To get started run these commands:

```bash
# download latest from Github

$ curl -L -O https://github.com/fvcproductions/dotfiles/archive/2.0.zip

# unzip the file and move to $HOME directory
unzip 2.0.zip && mv dotfiles-2.0 ~/.dotfiles

# run bootstrap!
sh ~/.dotfiles/bootstrap.sh
```

### Initialize Dotfiles

```bash
# Install `npm` and packages [bower, express, grunt-cli, jshint, less]
$ ./.dotfiles/init/.npm

# Install `casks` and tap to `caskroom-versions`
$ ./.dotfiles/init/.casks

# Install Sublime Text 3, Package Control, Spacegray Theme and Sublime Text Packages
$ ./.dotfiles/init/.subl

# Install Atom and Packages
$ ./.dotfiles/init/.atom

# Guide that helps you setup your git configuration and ssh-key setup for Github and Bitbucket
$ ./.dotfiles/init/.gituser

# Install oh-my-zsh, Spacegray.terminal theme, oh-my-zsh theme and configs
$ ./.dotfiles/init/.shell

# Setup vim, make it extra awesome..
$ ./.dotfiles/init/.vim

# OSX optimal awesome settings
$ ./.dotfiles/init/.osx

# Install fonts for coding and docs
$ ./.dotfiles/init/.fonts
```

### Sublime, Vim, ZShell

Modified version of [spacegray](http://github.com/kkga/spacegray.git)

![Spacegray](http://i.imgur.com/ejGME1z.png)

### Terminal and Zshell Theme

> #### HEADS UP!
> Once the theme has loaded, you might want to replace the shell's startup command
> from `login -fpql fvcproductions /bin/zsh` to `login -fpql YOURNAME /bin/zsh`
> from Preferences, under Profiles > Shell tab

![Terminal and Zshell Theme](http://i.imgur.com/Wc9hZiw.png)

## To-Do

- Download latest release of WakaTime Plugins
    + Sketch: https://github.com/wakatime/sketch-wakatime/releases/latest
- Install Material Icon Design Font
    + Link: https://materialdesignicons.com/getting-started

### Theming

Accents are as follows in accordance to the [ST3 Material Theme by equinusocio](https://github.com/equinusocio/material-theme):

- Lime: #7CB342
- Purple: #AB47BC
- Red: #E57373
- Orange: #FF7042
- Yellow: #FFA000
- Indigo: #5C6BC0

#### Acknowledgments

Inspiration and code:

  - [@mathiasbynens](https://github.com/mathiasbynens/dotfiles)
  - [@necolas](https://github.com/necolas/dotfiles)
  - [@cowboy](https://twitter.com/cowboy/dotfiles/)
  - [@ptb](https://github.com/ptb/Mac-OS-X-Lion-Setup)
  - [@pongstr](https://twitter.com/pongstr)
