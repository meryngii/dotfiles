#!/bin/sh

LINKED_FILES=".tmux.conf"

for LINKED in ${LINKED_FILES};
do
    ln -si ~/dotfiles/$LINKED ~/$LINKED
done

