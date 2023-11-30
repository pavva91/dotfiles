#!/bin/sh
# Need to activate notifications: sudo pacman -S notification-daemon
# Install xclip: sudo pacman -S xclip

bookmark="$(xclip -o)"
file="$HOME/Bookmark/list"

if grep -q "^$bookmark$" "$file"; then
    notify-send "Oops." "Already bookmarked!"
else
    notify-send "Bookmark saved!" "$bookmark is now saved to the file."
    echo "$bookmark" >> "$file"
fi
