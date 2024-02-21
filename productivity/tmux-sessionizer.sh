#!/usr/bin/env bash

selected=$(find ~ ~/gitlab ~/github ~/personal ~/work -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# tmux not running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	echo "DDD"
	tmux new-session -s "$selected_name" -c "$selected"
	exit 0
fi

# if session does not exist is created
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
	echo "AAA"
	tmux new-session -ds "$selected_name" -c "$selected"
fi

# tmux running but not open
if [[ -z $TMUX ]] && [[ $tmux_running ]]; then
	tmux attach -t "$selected_name"
	exit 0
fi

# tmux running and already open
tmux switch-client -t "$selected_name"
