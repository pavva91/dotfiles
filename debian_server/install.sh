#!/usr/bin/env bash

TERM=xterm-256color
sudo apt install git
sudo apt install stow
sudo apt install tmux

mkdir github
cd github
git clone https://github.com/pavva91/dotfiles
cd dotfiles

cd ~
mv .bashrc .bashrc.old
cd github/dotfiles

# BASH
stow -vn -t ~ bash
sudo apt install exa
add TERM=xterm-256color inside .bashrc

# FZF
sudo apt install fzf
# add this line to .bashrc to enable key-bindings:
#   - source /usr/share/doc/fzf/examples/key-bindings.bash

# VANILLA VIM (with clipboard)
sudo apt install vim-gtk3
stow -vn -t ~ vim_vanilla

# TMUX SETUP
stow -vn -t ~ tmux
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
tmux new -s backend
# inside tmux:
#   - run the command (<prefix>:):
#       - source-file ~/.tmux.conf
#   - Then install plugins:
#       - <prefix>I

