# TODO: nefunguje se STDIN (roura)
escape() {
  for arg in $@
    do echo $arg | sed -E "s/^(.+)\$/'\\1'/"
  done
}