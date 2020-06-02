#!/bin/sh

SCREENSHOT_DIR="${HOME}/Pictures/Screenshots"
CHOICES="1 Fullscreen|2 Select|3 Window"

cmd=$(echo -e $CHOICES | rofi -p "Screenshot" -i -width 250 -lines 3 -separator-style none -font "mono 10" -dmenu -sep "|")

case $cmd in
    "1 Fullscreen")
    scrot -e 'mv $f ~/Pictures/'
	;;
    "2 Select")
	scrot -s -e 'mv $f ~/Pictures/'
	;;
    "3 Window")
    scrot -u -e 'mv $f ~/Pictures/'
	;;
esac