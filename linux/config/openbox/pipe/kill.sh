#!/bin/bash

menu_home="$HOME/.config/openbox/pipe"
. "$menu_home/lib/shlib.sh"

config="$menu_home/etc/kill.yml"
config_no_items=`config_get "$config" "numbers_of_items"`
config_sukillcmd=`config_get "$config" "kill_admin"`
config_killcmd=`config_get "$config" "kill_user"`

psaux=`ps aux | sed -e 1D | awk '{print $1, $2, $3, $4, $11}'`

menu_begin

key=2

for menu_name in "CPU" "RAM";do
  echo '<!-- MENU '$menu_name' -->'
  echo '<menu id="'$menu_name'" label="'$menu_name'">'

  key=$((key+1))
   
  echo "$psaux" | sort -u -k 5 | sort -r -k $key | head -n$config_no_items | (while read line;do
    items=($line)

    process=${items[4]}
    owner=${items[0]}
    pid=${items[1]}
    ram_cpu=${items[$((key-1))]}
    
    bnprocess=`basename $process`

    [ "$owner" == "root" ] && cmd=$config_sukillcmd || cmd=$config_killcmd
     
    command="$cmd $pid"
     
    menu_item "$bnprocess ($ram_cpu%)" "$command"
  done)

  echo '</menu>'
done

menu_end
