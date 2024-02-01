#!/bin/bash

# Kill All
pkill -f pasystray
pkill -f blueman-applet
pkill -f nm-applet
pkill -f iwgtk

# START ALL

# Audio
pasystray --notify=all &

# Bluetooth
blueman-applet &

# Network with Network Manager
# nm-applet --indicator &

# Network without Network Manager
iwgtk -i &
