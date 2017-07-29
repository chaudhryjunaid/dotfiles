#!/bin/sh

set -e

BACKUP_PATH="$1"

if [[ $BACKUP_PATH =~ \.(t?gz$|tar.gz?) ]]; then
	cd $HOME && tar -xzvf $BACKUP_PATH
else if [ -d $BACKUP_PATH ] ; then
	cp -Rp $BACKUP_PATH $HOME
fi;

cp -Rp $HOME/backup/mac/home/* $HOME/

cp -Rp ~/backup/mac/rootLibrary/Preferences/SystemConfiguration/com.apple.airport.preferences.plist /Library/Preferences/SystemConfiguration/ # wifi

cp -Rp  ~/backup/mac/Library/Services/* ~/Library/Services/ # automator stuff
cp -Rp  ~/backup/mac/Library/Fonts/* ~/Library/Fonts # all those fonts you've installed

# editor settings & plugins
cp -Rp  ~/backup/mac/Library/Application\ Support/Sublime\ Text\ * ~/Library/Application\ Support/

#cp -Rp ~/backup/mac ~/Documents
#cp -Rp ~/backup/mac ~/Pictures
#cp -Rp ~/backup/mac ~/Downloads




