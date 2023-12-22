#!/bin/sh
# Need to install xdotool

# NOTE: Called from i3/config with: bindsym $alt+l exec alacritty --class floating-term -e ~/Bookmark/get_bookmark_fzf.sh

# use fzf
exec i3-msg -q "exec xdotool sleep 0.2 type $(fzf < ~/Bookmark/list | cut -d' ' -f1)"

