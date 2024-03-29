#!/usr/bin/env bash

languages=$(echo "golang c cpp typescript javascript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed awk jq" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -r -p "Give me your query: " query

if echo "$languages" | grep -qs "$selected"; then
    tmux split-window -p 33 -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
    tmux split-window -p 33 -h bash -c "curl cht.sh/$selected~$query | less"
fi
