#!/bin/sh

LINKED_FILES=".nvim .nvimrc"

for LINKED in ${LINKED_FILES};
do
    #rm -ri ~/$LINKED
    ln -si ~/dotfiles/$LINKED ~/$LINKED
done

