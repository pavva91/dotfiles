#!/bin/sh

xterm -name 'floating xterm' -e "fzf $" < /proc/$$/fd/0 > /proc/$$/fd/1
