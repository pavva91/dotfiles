#!/bin/sh

if [ ! $1 ]; then
   printf 'Note: no arguments given. e.g "rome", "paris"\n'
else
    location="$1"
    curl wttr.in/"$location"
fi
