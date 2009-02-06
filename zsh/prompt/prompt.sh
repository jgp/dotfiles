parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
setopt promptsubst # $(parse_git_branch) v RPS1 se nahradi

# prompt
if [ $UID -ne 0 ] ; then
  export PROMPT="%{$fg[cyan]%}%B%h>%b$fb[default] "
  export RPS1="%{$fg[cyan]%}%~%b%{$fg[default]%} %{$fg[red]%}\$(parse_git_branch)%{$fg[default]%}"
else
  export PROMPT="%B%h>%b "
  export RPS1="%B<%m:%~%b"
fi

# Title of xterm
case "$TERM" in
  xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
  *)
    ;;
esac