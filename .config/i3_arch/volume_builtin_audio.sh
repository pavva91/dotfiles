#!/bin/sh

builtin_audio_name="Built-in Audio"
builtin_audio_ids=$(wpctl status | rg "$builtin_audio_name +\[vol: [0-9]+.[0-9]+\]" | awk -F'[ . ]' '{print $8}')
echo $builtin_audio_ids > ~/log_bash_scripts/builtin_audio_ids.log
builtin_audio_id=$(awk '{print $1}' ~/log_bash_scripts/builtin_audio_ids.log)
echo $builtin_audio_id

case "$1" in
	"up")
        wpctl set-volume $builtin_audio_id 5%+ ;;
	"down")
        wpctl set-volume $builtin_audio_id 5%- ;;
esac
