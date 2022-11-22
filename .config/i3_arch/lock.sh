#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#00897bE6'
TEXT='#00897bE6'
WRONG='#880000bb'
VERIFYING='#00564dE6'
RING='#000F3AF1'
INSIDE_RING='#FFFFFFFF'

/usr/bin/i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$INSIDE_RING  \
--ring-color=$RING           \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--radius 120                 \
--ring-width 7.0             \
--blur 9                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %m %b %Y"    \
--keylayout 1                \
--pointer win                \
--show-failed-attempts       \
--ignore-empty-password      \
# --image ~/Pictures/Wallpapers/Ransomware-Splash-Screen.png \
# --tiling
