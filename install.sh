#!/usr/sh

git submodule init && git submodule update
mkdir _vim/backup
mkdir _vim/swp

cd ~
ln -s dotfiles/_vim     .vim
ln -s dotfiles/_vimrc   .vimrc
ln -s dotfiles/_gvimrc  .gvimrc
ln -s dotfiles/_vimshrc .vimshrc
ln -s dotfiles/_zshrc .zshrc
ln -s dotfiles/_gitconfig .gitconfig

