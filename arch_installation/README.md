# List of installed package (pacman)

## Create list all packages (with AUR)

```bash
pacman -Qqe > pkglist_all.txt
```

## Create list all packages (without AUR)

```bash
pacman -Qqe | grep -v "$(pacman -Qqm)" > pkglist_no_aur.txt
```

## Create list AUR packages (only AUR)

```bash
pacman -Qqm > pkglist_aur.txt
```

## Install packages from a list

### Pacman
To install packages from a previously saved list of packages, while not reinstalling previously installed packages that are already up-to-date, run:

```bash
pacman -S --needed - < pkglist_no_aur.txt
```

```bash
pacman -S --needed $(cat pkglist_no_aur.txt)
```

# AUR (yay)
```bash
yay -S $(cat pkglist_aur.txt)
```


However, it is likely foreign packages such as from the AUR or installed locally are present in the list. To filter out from the list the foreign packages, the previous command line can be enriched as follows:

```bash
pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
```

# List all foreign packages (for most users means AUR)

```bash
pacman -Qqm > aurpkglist.txt
```
