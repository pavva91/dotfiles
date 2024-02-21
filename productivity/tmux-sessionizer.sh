#!/usr/bin/env bash

selected=$(find ~ ~/gitlab ~/github ~/personal ~/work -mindepth 1 -maxdepth 1 -type d | fzf)

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# tmux not running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -s $selected_name -c $selected
	exit 0
fi

# tmux running but not open
if [[ -z $TMUX ]] && [[ $tmux_running ]]; then
	if ! tmux has-session -t=$selected_name 2>/dev/null; then
		tmux new-session -ds $selected_name -c $selected
	else
		tmux attach -t $selected_name
		exit 0
	fi
fi

# tmux running and open
tmux switch-client -t $selected_name

# if ! tmux has-session -t "$selected_name" 2> /dev/null; then
#     tmux new-session -s "$selected_name" -c "$selected" -d
# fi
#
# tmux switch-client -t "$selected_name"
