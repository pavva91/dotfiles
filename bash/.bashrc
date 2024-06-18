# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Prompt definition.
# You may want to put all your additions into a separate file like
# ~/.bash_prompt, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Variables definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_variables, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_variables ]; then
    . ~/.bash_variables
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# FZF script to enable fzf key-bindings
if [[ "$(cat /etc/os-release | grep Arch | wc -l)" == 2 ]]; then
    echo "I'm on Arch"
    # For Arch
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi
if [[ "$(cat /etc/os-release | grep Debian | wc -l)" == 2 ]]; then
    echo "I'm on Debian"
    # For Debian
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Node Version Management
source /usr/share/nvm/init-nvm.sh

# Nix Os packages
[[ -f /etc/profile.d/nix.sh ]] && . /etc/profile.d/nix.sh

# Node Version Manager Add (autocompletion)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# check if I'm on WSL
if [[ "$(</proc/sys/kernel/osrelease)" == *microsoft* ]]; then
    echo "I'm on WSL"
    source ~/bash_scripts/gitWSLWin10.sh
    source ~/bash_scripts/mavenWSLWin10.sh
else
    echo "I'm on bare metal linux"
fi
