#!/bin/sh

LINKED_FILES=".zplug .zshrc"

for LINKED in ${LINKED_FILES};
do
    ln -si ~/dotfiles/$LINKED ~/$LINKED
done

