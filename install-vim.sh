#!/bin/sh

LINKED_FILES=".vim .vimrc .gvimrc .vimshrc .bashrc .zshrc .gitconfig .gitignore"

for LINKED in ${LINKED_FILES};
do
    #rm -ri ~/$LINKED
    ln -si ~/dotfiles/$LINKED ~/$LINKED
done

vim +NeoBundleInstall! +qall

