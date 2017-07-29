#!/bin/sh

set -e

###  backup old machine's key items

mkdir -p ~/backup
mkdir -p ~/backup/mac
mkdir -p ~/backup/mac/home
mkdir -p ~/backup/mac/Library/"Application Support"/
mkdir -p ~/backup/mac/Library/Preferences/
mkdir -p ~/backup/mac/rootLibrary/Preferences/SystemConfiguration/

cd ~/backup/mac

# what is worth reinstalling?
brew leaves              > brew-list.txt    # all top-level brew installs
brew cask list           > cask-list.txt
npm list -g --depth=0    > npm-g-list.txt
#yarn global ls --depth=0 > yarn-g-list.txt

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)

# backup some dotfiles likely not under source control
cp -Rp \
    ~/.bash_history \
    ~/.extra ~/.extra.fish \
    ~/.gitconfig.local \
    ~/.gnupg \
    ~/.netrc \
    ~/.ssh \
    ~/.z   \
    ~/backup/mac/home

#cp -Rp ~/Documents ~/backup/mac
#cp -Rp ~/Pictures ~/backup/mac
#cp -Rp ~/Downloads ~/backup/mac

cp -Rp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/backup/mac/rootLibrary/Preferences/SystemConfiguration/ # wifi

cp -Rp ~/Library/Services ~/backup/mac/Library/ # automator stuff
cp -Rp ~/Library/Fonts ~/backup/mac/Library/ # all those fonts you've installed

# editor settings & plugins
cp -Rp ~/Library/Application\ Support/Sublime\ Text\ * ~/backup/mac/Library/"Application Support"

# also consider...
# random git branches you never pushed anywhere?
# git untracked files (or local gitignored stuff). stuff you never added, but probably want..
# OneTab history pages, because chrome tabs are valuable.
# usage logs you've been keeping.
# iTerm settings.
  # Prefs, General, Use settings from Folder
# software licenses.
#   sublimetext's is in its Application Support folder

### end of old machine backup

