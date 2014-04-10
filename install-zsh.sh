#!/bin/sh

LINKED_FILES=".oh-my-zsh .zshrc"

for LINKED in ${LINKED_FILES};
do
    ln -si ~/dotfiles/$LINKED ~/$LINKED
done

