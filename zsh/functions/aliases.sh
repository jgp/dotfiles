# TODO: nefunguje se STDIN (roura)
escape() {
  for arg in $@
    do echo $arg | sed -E "s/^(.+)\$/'\\1'/"
  done
}

# math 1 + 1
math() { echo $(($*)); }