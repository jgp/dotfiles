path-add()        { path+=("$@") }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# PATH
path-add /opt/local/bin
path-add /Developer/usr/bin
projects=~/data/projects/sources
test -d $projects && path-add $projects/**/bin
test -d $projects/scripts && path-add $projects/scripts
