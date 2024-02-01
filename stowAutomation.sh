#!/usr/bin/env bash

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="i3,i3blocks,alacritty,zsh,bash,tmux,nvim,vim,ranger,zathura"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/dotfiles
fi

STOW_FOLDERS=$STOW_FOLDERS DOTFILES=$DOTFILES $DOTFILES/install
