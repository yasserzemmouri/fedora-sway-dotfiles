#!/bin/zsh

# Options
lock="     Lock"
logout="   Logout"
shutdown=" Shutdown"
reboot="   Reboot"

# Show menu
selected=$(echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi -dmenu -i -p "Power" -theme-str 'window {width: 15em;}')

# Execute
case "$selected" in
    "$lock")      swaylock ;;
    "$logout")    swaymsg exit ;;
    "$shutdown")  systemctl poweroff ;;
    "$reboot")    systemctl reboot ;;
esac
