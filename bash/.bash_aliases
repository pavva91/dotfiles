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

# some more ls aliases
alias ll='exa -lF'
alias la='exa -lFa'
alias l='exa -CF'

# mv alias
alias mv='mv -iv'

# rm alias
alias rm='rm -iv'

# cat alias with bat
alias cat='bat'

alias c='clear'


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

# Restart VPN Service
alias restart_vpn_service='(sudo systemctl restart openvpn-client@ch-lu-01.protonvpn.com.udp.service)'

# Stop VPN Service
alias stop_vpn_service='(sudo systemctl stop openvpn-client@ch-lu-01.protonvpn.com.udp.service)'

# Fuzzy Find on Installed Packages
alias what_i_have=~/bash_scripts/what_i_have.sh

# Fuzzy Find on available packages and install it
alias search_and_install_package=~/bash_scripts/search_and_install_package.sh

# fzf alias to open file with vim
alias fzfvim=~/bash_scripts/fzfvim.sh

# fzf alias to open file with nvim
alias fzfnvim=~/bash_scripts/fzfnvim.sh
