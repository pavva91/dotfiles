#!/bin/bash

case "$(printf "Shutdown\nReboot\nLock\nLog out\n" | dmenu -l 10 -i -p "System: ")" in
    "Shutdown") sudo poweroff ;;
    "Reboot") sudo reboot ;;
    "Lock") ~/.config/i3/lock.sh ;;
    "Log out") i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit' ;;
    *) exit 1 ;;
esac

