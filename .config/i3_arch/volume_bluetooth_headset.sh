#!/bin/sh

bluetooth_headset_name="WH-1000XM3"
bluetooth_headset_id=$(wpctl status | rg "$bluetooth_headset_name +\[vol: [0-9]+.[0-9]+\]" | awk -F'[ . ]' '{print $7}')

case "$1" in
	"up")
        wpctl set-volume $bluetooth_headset_id 5%+ ;;
	"down")
        wpctl set-volume $bluetooth_headset_id 5%- ;;
	"toggle")
        wpctl set-mute $bluetooth_headset_id toggle ;;
esac
