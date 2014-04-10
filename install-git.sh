#!/bin/sh

LINKED_FILES=".gitconfig .gitignore"

for LINKED in ${LINKED_FILES};
do
    ln -si ~/dotfiles/$LINKED ~/$LINKED
done

