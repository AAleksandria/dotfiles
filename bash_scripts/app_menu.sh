#!/bin/sh

CHOICES="1 VSCode|2 GitKraken|3 Telegram|4 Files|5 PgAdmin"

cmd=$(echo -e $CHOICES | rofi -p "favorite" -i -width 270 -lines 5 -separator-style none -font "mono 12" -dmenu -sep "|")

case $cmd in
    "1 VSCode")
    code
	;;
    "2 GitKraken")
	gitkraken
	;;
    "3 Telegram")
    telegram-desktop
	;;
    "4 Files")
    nautilus
	;;
    "5 PgAdmin")
    pgAdmin4
	;;
esac