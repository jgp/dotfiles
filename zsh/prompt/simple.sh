simple_prompt() {
  case "$1" in
  on)  ls ;;
  off) ls ;;
  esac
  (test $UID -ne 0) && PROMPT="$ " || PROMPT="# "
  export PROMPT
  export RPS1=""
}