#!/usr/bin/env bash
# usage: ./archPackageBackup.sh /path/to/backup/file

BASE_PATH=$1

# create list of all packages (without aur)
pacman -Qqe | grep -v "$(pacman -Qqm)" > "$BASE_PATH"/pkglist_no_aur.txt

# create list of all aur packages
pacman -Qqm > "$BASE_PATH"/pkglist_aur.txt
