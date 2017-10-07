// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // hyper-spotify config
    hyperSpotify: {
      position: 'top' // or 'bottom'
    },
    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 18,

    // font family with optional fallbacks
    fontFamily: 'Input Mono, Roboto Mono, Menlo, Consolas, monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#FFD233',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // set to true for blinking cursor
    cursorBlink: true,

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#263239',

    // border color (window, tabs)
    borderColor: '',

    // custom css to embed in the main window
    css: `.tabs-nav { font-size: 20px !important; }; .tab_tab.tab_active{ border-bottom-width: 2px !important; border-color: #42A5F5 !important;}`,

    // custom css to embed in the terminal window
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#252525',
      red: '#FF5252',
      green: '#C3D82C',
      yellow: '#FFC135',
      blue: '#42A5F5',
      magenta: '#D81B60',
      cyan: '#00ACC1',
      white: '#F5F5F5',
      lightBlack: '#708284',
      lightRed: '#FF5252',
      lightGreen: '#C3D82C',
      lightYellow: '#FFC135',
      lightBlue: '#42A5F5',
      lightMagenta: '#D81B60',
      lightCyan: '#00ACC1',
      lightWhite: '#F5F5F5'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    `hyper-spotify`,
    `hyperterm-tab-icons`,
    `hypercwd`,
    `hyper-sync-settings`,
    `hyperterm-paste`
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
};