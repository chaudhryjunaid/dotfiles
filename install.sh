#!/bin/sh


set -e
set -o pipefail


ln -s ./vim/vimrc ~/.vimrc
ln -s ./vim/gvimrc ~/.gvimrc
ln -s ./git/gitexcludes ~/.gitexcludes
ln -s ./git/gitconfig ~/.gitconfig

exit 0;

