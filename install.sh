#!/bin/sh


set -e
set -o pipefail


#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sfv ~/opensource/dotfiles/vim/vimrc ~/.vimrc
ln -sfv ~/opensource/dotfiles/vim/gvimrc ~/.gvimrc


ln -sfv ~/opensource/dotfiles/git/gitexcludes ~/.gitexcludes
ln -sfv ~/opensource/dotfiles/git/gitconfig ~/.gitconfig

exit 0;

