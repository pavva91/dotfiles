#!/bin/bash

# REMOVE ALL FOLDERS

cd ~/.config

rm -r alacritty
mkdir alacritty

rm -r i3
mkdir i3

rm -r i3blocks
mkdir i3blocks

rm -r i3status
mkdir i3status

rm -r nvim
mkdir nvim

rm -r ranger
mkdir ranger


# STOW THE EVERYTHING

cd ~/.dotfiles/.config

stow -v -t ~/.config/alacritty alacritty
stow -v -t ~/.config/i3 i3
stow -v -t ~/.config/i3blocks i3blocks
stow -v -t ~/.config/i3copy i3copy
stow -v -t ~/.config/i3status i3status
stow -v -t ~/.config/nvim nvim
stow -v -t ~/.config/ranger ranger
