#!/bin/sh
# INFO: adapted from: https://legacy.sr.ht/EJ5C.sh
# INFO: output_file="/tmp/screenshot-$(date '+%F-%T').png"
# INFO: output_file="/home/bob/Pictures/Screenshots/screenshot-$(date '+%F-%T').png"
output_file="$HOME/Pictures/Screenshots/screenshot-$(date '+%F-%T').png"
[ $# -eq 0 ] && {
	echo "Usage: $0 needs at least one argument"
	exit 1
}
case "$1" in
"full")
	maim "$output_file"
	;;
"rect")
	maim --select "$output_file"
	;;
"active_window")
	maim --window "$(xdotool getactivewindow)" "$output_file"
	;;
esac
