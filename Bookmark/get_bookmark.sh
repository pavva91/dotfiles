#!/bin/sh
# Need to install xdotool

# use dmenu
xdotool type $(grep -v '^#' ~/Bookmark/list | dmenu -i -l 50 | cut -d' ' -f1)
