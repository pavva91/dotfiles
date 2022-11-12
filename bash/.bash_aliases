# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ls aliases (Rust)
alias ll='exa -lF'
alias la='exa -lFa'
alias l='exa -lF -snew'

# mv alias
alias mv='mv -iv'

# rm alias
alias rm='rm -iv'

# cat alias with bat (Rust)
alias cat='bat'

# find alias with fd (Rust)
alias find='fd'

# Use procs instead of ps

# clear aliases (ctrl-l doesn't work with vim-tmux integration)
alias c='clear'
alias L='clear'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Remove orphaned packages.
# Needs single quotes, otherwise the newlines that "pacman -Qqdt" outputs
# cause trouble.
# The parentheses create a subshell meaning "set -x" that prints the executed
# Bash commands is unset when the subshell exits at the end of the command.
# Arguments to "pacman -Q":
#    -d restrict output to packages installed as dependencies
#    -t list packages that are no longer required by any installed package
#    -q suppress version numbers of packages (this would confuse pacman -R)
alias cleanup_packages='(set -x; sudo pacman -Rs $(pacman -Qdtq))'

# Fuzzy Find on Installed Packages
alias what_i_have=~/bash_scripts/what_i_have.sh

# Fuzzy Find on Installed Packages and remove it
alias remove_program=~/bash_scripts/remove_program.sh

# Fuzzy Find on available packages and install it
alias search_and_install_package=~/bash_scripts/search_and_install_package.sh

# fzf alias to open file with vim
alias fzfvim=~/bash_scripts/fzfvim.sh

# fzf alias to open file with nvim
alias fzfnvim=~/bash_scripts/fzfnvim.sh

# List processes and kill selected (with tab)
alias kp=~/bash_scripts/kill_processes.sh

# Get weather
alias wtr=~/bash_scripts/get_weather.sh

# Speed Test
alias st='https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py'

# Get Command Cheatsheet
alias cheat=~/bash_scripts/get_command_cheatsheet.sh

# Start tmux base session
alias based=~/bash_scripts/start_tmux_base_session.sh

# Fix zsh history
alias fix_zsh_history=~/bash_scripts/zsh_history_fix.sh

# Connect to VPN Interactively
alias connect_vpn=~/bash_scripts/start_vpn.sh

alias vpn_fix_after_inactivity_wifi=~/bash_scripts/vpn_fix_after_inactivity_wifi.sh
