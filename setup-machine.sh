#!/bin/sh

# The following script sets up a new machine for development
#

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

	zshrc = "$HOME/.zshrc.local"
  if [ ! -f "$zshrc" ]; then
		touch "$zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

fancy_echo "This will setup your machine for development."
fancy_echo "It is recommended to have installed latest XCode by this point.";
fancy_echo "Do you want to proceed? (y/n) "
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Nn]$ ]]
then
	fancy_echo "Exiting...";
	exit 1;
fi

### Install XCode Command Line Tools
# https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh
fancy_echo "(Step 1/) Installing XCode command line tools"
if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi

# Make commonly used directories
mkdir -p ~/opensource
mkdir -p ~/careaxiom
mkdir -p ~/code
mkdir -p ~/apps


# Install Homebrew
# Check for Homebrew
HOMEBREW_PREFIX="/usr/local"

if [ -d "$HOMEBREW_PREFIX" ]; then
  if ! [ -r "$HOMEBREW_PREFIX" ]; then
    sudo chown -R "$LOGNAME:admin" /usr/local
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
fi

if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi

fi

# PATH added to zshrc once in config
append_to_zshrc("export PATH=/usr/local/bin:/usr/local/sbin:$PATH");

# install all the things
sh ./brew.sh

append_to_zshrc("export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH");

sh ./custom.install.sh

update_shell() {
  local shell_path;
  shell_path="$1"

  fancy_echo "Changing your shell to zsh ..."
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    fancy_echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  chsh -s "$shell_path"
}


# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
ZSHPATH=$(brew --prefix)/bin/zsh
update_shell("$BASHPATH");
update_shell("$ZSHPATH");

# Later, confirm iterm settings aren't conflicting.


# iterm with more margin! http://hackr.it/articles/prettier-gutter-in-iterm-2/
#   (admittedly not as easy to maintain)


# setting up the sublime symlink
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl


# improve perf of git inside of chromium checkout
# https://chromium.googlesource.com/chromium/src/+/master/docs/mac_build_instructions.md

# default is (257*1024)
sudo sysctl kern.maxvnodes=$((512*1024))

echo kern.maxvnodes=$((512*1024)) | sudo tee -a /etc/sysctl.conf

# speed up git status (to run only in chromium repo)
#git config status.showuntrackedfiles no
#git update-index --untracked-cache

# also this unrelated thing; configure using extra file
#git config user.email "paulirish@chromium.org"


### remaining configuration
###

# prezto and antigen communties also have great stuff
#   github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh

sh ./configure-macos.sh

if [ -f "$HOME/.setup.local" ]; then
  fancy_echo "Running your customizations from ~/.setup.local ..."
  # shellcheck disable=SC1090
  . "$HOME/.setup.local"
fi

###

#   move git credentials into ~/.gitconfig.local    	http://stackoverflow.com/a/13615531/89484
#   now .gitconfig can be shared across all machines and only the .local changes

# add manual symlink for .ssh/config and probably .config/fish

###
