# Sexy Sublime

> This folder contains all my Sublime Text 3 preferences and packages for easy syncing.

---

<img src="http://i.imgur.com/0EjQtmk.png?1">

---

## Steps

1.  Make sure to install <a href="https://packagecontrol.io/" target="_blank">Package Control</a> first!

    ```text
    import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
    ```

2.  Close `Sublime Text`
3.  Open `Terminal`

### First Machine

On your first machine, use the following instructions.

```bash
# change into Sublime Text 3 packages directory
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# create Sublime folder in Dropbox/Google Drive/etc. directory
mkdir /Users/fvcproductions/Dropbox/GitHub/sexy-sublime
# mv User folder from Sublime Text Packages to this newly created folder
mv User /Users/fvcproductions/Dropbox/GitHub/sexy-sublime
# create an alias between the two folders
ln -s Users/fvcproductions/Dropbox/GitHub/sexy-sublime/User
```

### Other Machine(s)

On your other machine(s), use the following instructions.

These instructions will remove your `User` folder and all contents!

```bash
# change into Sublime Text 3 packages directory
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# remove User folder
rm -r User
# create alias with existing User folder
ln -s /Users/fvcproductions/Dropbox/GitHub/dotfiles/bin/subl/User
```

## To Note

Technically, the only 3 files you need are

-   Default (OSX).sublime-keymap
-   Package Control.sublime-settings
-   Preferences.sublime-settings

However, if you have settings within individual packages, you'll have to use the method described above.
