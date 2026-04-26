#!/bin/zsh
cliphist list | rofi -dmenu -p "Clipboard" | cliphist decode | wl-copy
