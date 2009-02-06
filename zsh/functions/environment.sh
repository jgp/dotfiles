# file-save RUBYLIB $RUBYLIB rubylib
file-save() { echo "export $1='$2'" > ~/.cache/$3 }
file-load() { [[ -f source ~/.cache/$1 ]] && source ~/.cache/$1 }