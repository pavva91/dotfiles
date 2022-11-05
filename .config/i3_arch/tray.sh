#!/bin/bash

# Kill All
pkill -f pasystray
pkill -f blueman-applet
pkill -f nm-applet

# START ALL

# Audio
pasystray --notify=all &

# Bluetooth
blueman-applet &

# Network
nm-applet --indicator &
