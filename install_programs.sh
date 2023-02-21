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
    base-devel \
    i3 \
    i3blocks \
    rofi \
    vim \
    alacritty \
    tmux \
    pyenv \
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
    keepassxc \

yay -S nvm

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

# Tmux
sudo pacman -S tmux
# Install tmux plugin manager (tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf

#Open tmux
tmux
	- Install tmux plugins: prefix+I

# Rust gnu utils
sudo pacman -S exa bat fd

# Create Dir Screenshots
mkdir ~/Pictures/Screenshots

# Install Synology Drive
yay -S synology-drive
