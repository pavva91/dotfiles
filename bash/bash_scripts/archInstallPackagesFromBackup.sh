#!/usr/bin/env bash

# usage: ./archPackageBackup.sh /path/to/backup/folder/

BASE_PATH=$1

sudo pacman -S --needed "$(cat "$BASE_PATH"/pkglist_no_aur.txt)"

yay -S "$(cat "$BASE_PATH"/pkglist_aur.txt)"
