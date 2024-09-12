#!/usr/bin/env bash

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="x11,i3,i3blocks,alacritty,zsh,bash,tmux,nvim,vim,ranger,zathura,spacemacs"
fi

if [[ -z $DOTFILES_PATH ]]; then
    DOTFILES_PATH=$HOME/dotfiles
fi

# STOW_FOLDERS=$STOW_FOLDERS DOTFILES_PATH=$DOTFILES_PATH $DOTFILES_PATH/install

cd "$DOTFILES_PATH" || exit

IFS=',' read -r -a programs <<< "$STOW_FOLDERS"
for program in "${programs[@]}"; do
    stow $program
done

