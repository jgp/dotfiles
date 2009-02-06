#!/bin/bash

menu_home="$HOME/.config/openbox/pipe"
. "$menu_home/lib/shlib.sh"

debug_file="$HOME/.config/openbox/pipe/TMP.xml"

menu_begin

[ -r "$debug_file" ] && cat "$debug_file" || menu_error "There is no file TMP.xml!"

menu_end
