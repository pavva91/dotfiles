# Create symlinks with stow

## Stow default behaviour
Stow will by default look for that package in the local directory and then symlink it into the parent directory
Default stow behaviour is: `stow -t ..`

To simulate the stow symlink creation do: -nv
`stow -nv -t ~/.config .config`

`cd dotfiles`
`stow --target=~ .dotfiles`

## Stow bash dotfiles (e.g. .bashrc)
`cd dotfiles`
`stow -t ~ bash`

## Stow i3 dotfiles
Before create the i3 folder in ~/.config
`cd ~/.config`
`mkdir i3`
Then stow i3 config folder
`cd dotfiles`
`stow -t ~/.config/i3 i3`
Always check before changing the filesystem with:
`stow -vn -t ~/.config/i3 i3`

## Stow alacritty dotfiles
Before create alacritty folder in ~/.config
`mkdir ~/.config/alacritty`
Then stow:
` cd ~/.dotfiles`
`stow -t ~/.config/alacritty alacritty`

rm on symlink will remove the symlink only
https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html
