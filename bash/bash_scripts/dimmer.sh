#!/bin/bash

# SCREEN=HDMI-1
# SCREEN=eDP-1
while getopts "d:n:r:g:" OPTION; do
    SCREEN=${OPTARG}
    case $OPTION in
        d)
            # default
            xrandr --output $SCREEN --gamma 1:1:1 --brightness 0.7
            exit 0
            ;;
        n)
            # nighttime
            xrandr --output $SCREEN --gamma 1.1:0.8:0.7 --brightness 0.55
            exit 0
            ;;
        r)
            # reading
            xrandr --output $SCREEN --gamma 0.9:0.9:0.8 --brightness 0.85
            exit 0
            ;;
        g)
            # high contrast for gaming
            xrandr --output $SCREEN --gamma 0.9:0.9:0.9 --brightness 1.3
            exit 0
            ;;
        ?)
            echo "Script usage: -l to get the list of available VPNs."
            exit 0
            ;;
    esac
done
