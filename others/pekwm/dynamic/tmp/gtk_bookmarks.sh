#!/bin/bash

menu_home="$HOME/.config/openbox/pipe"
. "$menu_home/lib/shlib.sh"

config="$menu_home/etc/gtk_bookmarks.yml"
config_fileman=`config_get "$config" "file_manager"`
gtk_file="$HOME/.gtk-bookmarks"

menu_begin
cat "$gtk_file" | (while read line;do
  item=`echo $line | sed "s/file:\/\///"`
  menu_item "`basename $item`" "$config_fileman $item" 
done)

menu_end
				