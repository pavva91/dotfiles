# Configure Arch Linux

1. Run './install_programs.sh'
2. Install programs:

```bash
sudo pacman -S - < ./arch_installation/backup/pkglist_no_aur.txt
```

3. Stow configs

Run './stowAutomation.sh'
The bash script is doing this:

```bash
cd dotfiles
stow x11
stow i3
stow i3blocks
stow alacritty
stow zsh
stow bash
stow tmux
stow nvim
stow vim
stow ranger
stow zathura
stow spacemacs
```

4. Install Yay:
   [https://github.com/Jguer/yay](https://github.com/Jguer/yay)
5. Configure zsh:
   - follow ./zsh/README.md

# Create symlinks with stow

## Stow default behaviour

Stow will by default look for that package in the local directory and then symlink it into the parent directory
Default stow behaviour is: `stow -t ..`
for example (`cd dotfiles`)
`stow i3`
`stow i3blocks`
`stow alacritty`
`stow zsh`
`stow bash`
`stow tmux`
`stow nvim`
`stow vim`
`stow ranger`
`stow zathura`
Stow List:

1. i3
2. i3blocks
3. alacritty
4. zsh
5. bash
6. tmux
7. nvim
8. vim
9. ranger
10. zathura

To simulate the stow symlink creation do: -nv
`stow -nv -t ~/.config .config`

## Stow all .config directory in one command

1. Go to the dotfiles repository
   `cd dotfiles`
2. Stow the .config into ~/.config
   `stow -v -t ~/.config .config`

## Stow vconsole (remap Esc with Caps-lock)

1. Go to the dotfiles repository
   `cd dotfiles/root_folder`
2. Stow the bash into ~
   `sudo stow -v -t /etc etc`

## Stow bash dotfiles (e.g. .bashrc)

1. Go to the dotfiles repository
   `cd dotfiles`
2. Stow the bash into ~
   `stow -t ~ bash`

## Stow vim dotfiles (.vimrc)

1. Go to the dotfiles repository
   `cd dotfiles`
2. Stow the vim into ~
   `stow -v -t ~ vim`

## Stow i3 dotfiles

a. Before create the i3 folder in ~/.config
`cd ~/.config` and `mkdir i3`
b. Then stow i3 config folder

1. Go to the .config subrepository of this dotfiles repository
   `cd dotfiles/.config`
2. Stow i3 into ~/.config/i3
   `stow -v -t ~/.config/i3 i3`
   Always check before changing the filesystem with:
   `stow -vn -t ~/.config/i3 i3`

## Stow alacritty dotfiles

Before create alacritty folder in ~/.config
`mkdir ~/.config/alacritty`
Then stow:
` cd ~/.dotfiles/.config`
`stow -v -t ~/.config/alacritty alacritty`

## Stow nvim dotfiles

Before create nvim folder in ~/.config
`mkdir ~/.config/nvim`
Then stow:
` cd ~/.dotfiles/.config`
`stow -v -t ~/.config/nvim nvim`

## Stow x11 dotfiles (general config of i3)

Stow:
` cd ~/.dotfiles`
`stow -v -t ~ x11`

rm on symlink will remove the symlink only
https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html
