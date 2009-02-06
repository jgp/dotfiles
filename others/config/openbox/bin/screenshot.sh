#!/bin/bash

SCREENSHOT="/home/botanicus/Screenshots/`zenity --entry --title "Ulozit screenshot" --text "Jmeno screenshotu:" --entry-text ".png"`"

if [ -f $SCREENSHOT ] ; then
	zenity --error --title "Screenshot" --text "Chyba: soubor jiz existuje."
	exit 1
else
	scrot -cd 5 $SCREENSHOT
fi
