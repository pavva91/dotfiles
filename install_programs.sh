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
    fzf \
    pasystray \
    network-manager-applet \
    blueman \
    yay \


./config_vim.sh

# Nerd Fonts i3
mkdir ~/.local/share/fonts
mkdir ~/.local/share/fonts/NerdFonts
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/UbuntuMono.zip
mkdir ~/.local/share/fonts/NerdFonts/UbuntuMono
unzip UbuntuMono.zip -d ~/.local/share/fonts/NerdFonts/UbuntuMono

# Nerd Fonts Alacritty
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
mkdir ~/.local/share/fonts/NerdFonts/JetBrainsMono
unzip JetBrainsMono.zip -d ~/.local/share/fonts/NerdFonts/JetBrainsMono

# Image Preview on Ranger
sudo pacman -S w3m

# Lock
yay -S i3lock-color
