#!/bin/zsh

# This shows results in Rofi instead of terminal
selected=$(find ~ -type f 2>/dev/null | fzf --print0 | xargs -0 -I {} echo {})
[[ -n "$selected" ]] && rofi -dmenu -p "Open file" <<< "$selected" | xargs -I {} xdg-open {}
