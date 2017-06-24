#!/bin/sh


set -e
set -o pipefail


#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sv ./vim/vimrc ~/.vimrc
ln -sv ./vim/gvimrc ~/.gvimrc


ln -sv ./git/gitexcludes ~/.gitexcludes
ln -sv ./git/gitconfig ~/.gitconfig

exit 0;

