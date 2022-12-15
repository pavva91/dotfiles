#!/bin/bash

alacritty -e cmatrix &
sleep 0.2

i3-msg fullscreen

i3-lock -n; i3-msg kill
