#!/bin/sh

LINKED_FILES=".hgrc"

for LINKED in ${LINKED_FILES};
do
    ln -si ~/dotfiles/$LINKED ~/$LINKED
done

