#!/bin/sh

#LOCKER="xkblayout-state set 0 && i3lock -c 000000 -e -f && sleep 1"
LOCKER="lock"
CHOICES="1 Logout|2 Suspend|3 Reboot|4 Shutdown"

# cmd=$(echo -e $CHOICES | rofi -i -width 300 -lines 6 -theme solarized_alternate -dmenu -sep "|")
cmd=$(echo -e $CHOICES | rofi -i -width 250 -lines 4 -separator-style none -font "mono 10" -dmenu -sep "|")

case $cmd in
    "1 Logout")
    pkill -u alexsad
    ;;
    "2 Suspend")
    systemctl suspend
    ;;
    "3 Reboot")
    systemctl reboot
    ;;
    "4 Shutdown")
    systemctl poweroff -i
    ;;
esac