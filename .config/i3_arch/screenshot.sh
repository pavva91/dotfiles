#!/bin/sh
# adapted from: https://legacy.sr.ht/EJ5C.sh
#output_file="/tmp/screenshot-$(date '+%F-%T').png"
#output_file="/home/bob/Pictures/Screenshots/screenshot-$(date '+%F-%T').png"
output_file="$HOME/Pictures/Screenshots/screenshot-$(date '+%F-%T').png"

case "$1" in
	"full")
		maim $output_file ;;
	"rect")
		maim --select $output_file ;;
	"active_window")
		maim --window $(xdotool getactivewindow) $output_file;;
esac
