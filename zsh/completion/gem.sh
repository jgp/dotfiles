_gems()         { gem list $1 | awk '{ print $1 }' | egrep -v "^$|^\*+$" }
_gem_commands() { gem help commands | awk '{ print $1 }' }
_remote_gem()   { _gems --remote }
_local_gem()    { _gems --local }

compdef _remote_gem "gem install"

for command in _gem_commands ; do
  compdef _gnu_generic "gem $command"
done

# print -z foo