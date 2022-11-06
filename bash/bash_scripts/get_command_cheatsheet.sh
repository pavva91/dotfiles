#!/bin/sh

if [ ! $1 ]; then
   printf 'Note: no arguments given. e.g "rsync", "grep"\n'
else
    command="$1"
    curl https://cheat.sh/"$command" | less
fi
