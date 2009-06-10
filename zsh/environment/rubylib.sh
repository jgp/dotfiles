typeset -T -U -gx -a RUBYLIB rubylib ':'

rubylib-add()    { rubylib+=("$@") }
rubylib-delete() { for i ("$@") { rubylib[(r)$i]=() } }
rubylib-clear()  { rubylib=() }

rubylib-clear

projects=~/Projects/sources
test -d $projects && rubylib-add $projects/**/lib
