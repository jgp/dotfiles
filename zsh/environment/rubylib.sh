typeset -T -U -gx -a RUBYLIB rubylib ':'

rubylib-add()    { rubylib+=("$@") }
rubylib-delete() { for i ("$@") { rubylib[(r)$i]=() } }
rubylib-clear()  { rubylib=() }

rubylib-clear

projects=~/data/projects/sources
test -d $projects && rubylib-add $projects/**/lib
