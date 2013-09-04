#!/bin/sh

LINKED_FILES=".vim .vimrc .gvimrc .vimshrc .bashrc .zshrc .gitconfig .gitignore"

git submodule init && git submodule update

for LINKED in ${LINKED_FILES};
do
    rm -ri ~/$LINKED
    ln -s $LINKED ~/$LINKED
done

vim +NeoBundleInstall! +qall

