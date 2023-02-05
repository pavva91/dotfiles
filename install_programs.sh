cd ~
git clone https://github.com/pavva91/dotfiles
cd ~/dotfiles

stow -v -t ~ bash
stow -v -t ~ zsh
stow -v -t ~ vim
stow -v -t ~ tmux

cd ~/dotfiles/.config

mkdir ~/.config/i3blocks
stow -v -t ~/.config/i3blocks i3blocks

mkdir ~/.config/i3status
stow -v -t ~/.config/i3status i3status

mkdir ~/.config/i3
stow -v -t ~/.config/i3 i3

mkdir ~/.config/alacritty
stow -v -t ~/.config/alacritty alacritty

mkdir ~/.config/ranger
stow -v -t ~/.config/ranger ranger

sudo pacman -S \
    i3 \
    rofi \
    vim \
    alacritty \
    tmux \
    tree \
    feh \
    maim \
    ranger \
    zathura \
