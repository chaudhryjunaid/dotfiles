#!/bin/sh


set -e
set -o pipefail


#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/plugged

ln -sfv ~/opensource/dotfiles/vim/vimrc ~/.vimrc
ln -sfv ~/opensource/dotfiles/vim/gvimrc ~/.gvimrc

ln -sfv ~/opensource/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

ln -sfv ~/opensource/dotfiles/git/gitexcludes ~/.gitexcludes
ln -sfv ~/opensource/dotfiles/git/gitconfig ~/.gitconfig

ln -sfv ~/opensource/dotfiles/tern-config ~/.tern-config
ln -sfv ~/opensource/dotfiles/ctrlpignore ~/.ctrlpignore
ln -sfv ~/opensource/dotfiles/liquidpromptrc ~/.liquidpromptrc
ln -sfv ~/opensource/dotfiles/tmux.conf ~/.tmux.conf

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

exit 0;

