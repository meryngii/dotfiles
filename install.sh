#!/bin/sh

LINKED_DIRECTRIES=".vim"
LINKED_FILES=".vimrc .gvimrc .vimshrc .zshrc .gitconfig .gitignore"

git submodule init && git submodule update

for LINKED_FILE in ${LINKED_FILES};
do
    #rm -rf ~/${LINKED_FILE}
    mklink /D ~/$LINKED $LINKED
done

vim +NeoBundleInstall! +qall

