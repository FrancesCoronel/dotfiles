# Dotfiles

This sets up my dev environment to be very Material Design friendly.

![Showcase](img/showcase.png)

## To-Do

- make all online apps into casks
    + [Airtable](https://airtable.com/mac)
    + [Zeit Now]()
    + Sorty
    + WakaTime Plugins
        + [Sketch](https://github.com/wakatime/sketch-wakatime/releases/latest)

## Requirements

**[Xcode](https://developer.apple.com/xcode/)** &amp; **[Command Line Tools](https://developer.apple.com/downloads)**

The `sudo` command is necessary for Homebrew to be installed and for some others.

### To get started run these commands:

```bash
# download latest from Github

$ curl -L -O https://github.com/fvcproductions/dotfiles/archive/2.0.zip

# unzip the file and move to $HOME directory
unzip 2.0.zip && mv dotfiles-2.0 ~/.dotfiles

# run bootstrap!
sh ~/.dotfiles/bootstrap.sh
```

## Initialize Dotfiles

```bash
# Installs npm and certain npm packages
$ ./.dotfiles/init/.npm

# Installs casks and taps to caskroom-versions
$ ./.dotfiles/init/.casks

# Installs Sublime Text 3, Package Control, theme, and packages
$ ./.dotfiles/init/.subl

# Installs Atom and Packages
$ ./.dotfiles/init/.atom

# Guide that helps you setup your git configuration and ssh-key setup for Github and Bitbucket
$ ./.dotfiles/init/.gituser

# Installs oh-my-zsh, terminal theme, oh-my-zsh theme and configs
$ ./.dotfiles/init/.shell

# OSX optimal awesome settings
$ ./.dotfiles/init/.osx

# Installs fonts for coding and docs
$ ./.dotfiles/init/.fonts
```

## Alfred 3

![alfred](img/alfred.png)

## Sublime Text 3

![sublime-text](img/sublime-text.png)

## Terminal and Z-shell Theme

Once the theme has loaded, you might want to replace the shell's startup command in `Preferences` under `Profiles > Shell Tab`:

`login -fpql fvcproductions /bin/zsh` to `login -fpql YOURNAME /bin/zsh`

![terminal](img/terminal.png)

## Theming

Accents are as follows in accordance to the [ST3 Material Theme by equinusocio](https://github.com/equinusocio/material-theme):

- Lime: #7CB342
- Purple: #AB47BC
- Red: #E57373
- Red Orange: #F74A50
- Orange: #FF7042
- Yellow: #FFA000
- Indigo: #5C6BC0
- Pink: #FF4081
- Blue: #2979FF
- Cyan: #00BCD4

## Credits

- [@fvcproductions](https://github.com/fvcproductions/)
- [@mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [@necolas](https://github.com/necolas/dotfiles)
- [@cowboy](https://github.com/cowboy/dotfiles/)
- [@ptb](https://github.com/ptb/Mac-OS-X-Lion-Setup)
- [@pongstr](https://twitter.com/pongstr)
