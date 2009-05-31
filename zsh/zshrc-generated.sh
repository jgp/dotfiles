source /etc/profile
# bindkey -v                 # editor jako vi
bindkey -e                 # editor jako emacs
bindkey ' ' magic-space      # mezerník rozbaluje odkazy na historii
bindkey '^[[3~' delete-char
bindkey '^[OH'  beginning-of-line # home
bindkey '^[OF'  end-of-line  # end
bindkey '^K' kill-line
bindkey '^Y' yank

bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
# http://stuff.mit.edu/~jdong/misc/zshrc-osx-blackonwhite
# http://gentoo-wiki.com/TIP_Advanced_zsh_Completion

autoload -U compinit && compinit
autoload colors && colors
autoload -U zmv

setenv() { export $1=$2 }    # kompatibilita s csh

# Set options
HISTFILE=~/.history          # soubor pro ukládání do historie
HISTSIZE=5000
SAVEHIST=5000                # ukládá se 50 příkazů

# append command to history file once executed
setopt inc_append_history
setopt HIST_IGNORE_SPACE     # řádek začínající mezerou si nepamatuje
setopt HIST_IGNORE_ALL_DUPS  # vyhazuje z historie staré duplikáty
setopt EXTENDED_GLOB         # rozšířené žolíkové znaky
# setopt NO_CLOBBER            # ochrana při přesměrovávání výstupů
# setopt CORRECTALL            # opravy překlepů
setopt NO_BEEP               # nepípat při chybách

# File completion
setopt AUTOLIST              # vypisuje možnosti pro doplnění
setopt NO_LIST_AMBIGUOUS     # vypisuje je HNED, ne až při druhém <Tab>
setopt LIST_PACKED           # zkrácený výpis
zmodload -i zsh/complist     # obarví vypisované soubory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache

setopt autocd

# TODO: nefunguje se STDIN (roura)
escape() {
  for arg in $@
    do echo $arg | sed -E "s/^(.+)\$/'\\1'/"
  done
}

# math 1 + 1
math() { echo $(($*)); }

# file-save RUBYLIB $RUBYLIB rubylib
file-save() { echo "export $1='$2'" > ~/.cache/$3 }
file-load() { [[ -f source ~/.cache/$1 ]] && source ~/.cache/$1 }

LS() {
	/bin/ls | awk '{ print "mv", $1, $1 }' > LS
}

function zls() {
   du -h `tar -tzf $1`
}

# title page of books pushed to knihy.root.cz
book() {
	convert "$1" -resize 200 "$1"
}
# FIXME
perex() {
	convert "$1" -resize ??? "$1-perex"
}

download_all() {
    "wget -nH --no-parent --recursive --cut-dirs=3 " $1 &&
    find . -name 'index*' -exec rm \{\} ';'
}

# hledání v běžících procesech
psg () {
  ps -ax | egrep $* | grep -v grep 
}

function zls() {
   du -h `tar -tzf $1`
}

password() { grep -i -E $1 /Users/botanicus/Documents/Others/Passwords.txt }

kill_merb() {
  id=$(ps aux | grep merb | grep work | awk '{ print $2 }')
  echo "Killing $id ..."
  kill -9 $id
}

alias -g ERR="> /dev/null"
alias -g QUIET="2> /dev/null"
alias -g T="tail -f"

alias -g LAST="| tail -1"
alias -g FIRST="| head -1"

alias -g FILES="**/*(.)"
alias -g BCKP="**/*~"
alias -g SWP="**/.*.swp"

publish() {
  help() {
    echo "=== Help ==="
    echo "publish add CV.pdf"
    echo "publish rm CV.pdf"
    echo "publish list"
    echo "publish run 'command'"
  }
  command=$1 && shift
  case $command in
  add)
    for file in $* ; do
      scp -r "$file" static@solaris:/webs/static/public.botablog.cz > /dev/null
      echo "http://public.botablog.cz/$(basename $file)"
    done ;;
  ls|list)
    ssh static@solaris ls -l /webs/static/public.botablog.cz ;;
  rm|del|delete)
    for file in $* ; do
      ssh static@solaris rm -rf /webs/static/public.botablog.cz/$file
    done ;;
  run)
    ssh static@solaris "cd /webs/static/public.botablog.cz && $*" ;;
  *)
    help ;;
  esac
}

# mac sleeping
alias sleep_hdd="sudo pmset -a hibernatemode 1"
alias sleep_ram="sudo pmset -a hibernatemode 0"
alias sleep_combined="sudo pmset -a hibernatemode 3"

# mv, cp, rm
alias cp='cp -i'
alias mv='mv -i'
alias rmr="rm -r"
alias rmf="rm -f"
alias rmrf="rm -rf"

# df, du
alias df='df -h'
du() {
  for item in $* ; do
    /usr/bin/du -h $item | tail -1
  done
}

# ls
#alias ls='ls -GFh'
alias ls='ls -FhG'
alias ll='ls -GlhF'
alias la='ls -GAF'
alias lx='ls -lXB' # sorted by type
alias lk='ls -lSr' # sorted by size
alias lc='ls -lcr' # sorted by date of last change

# cd
alias .='cd .' # reload (e.g.: you're in app/current)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# gem
alias gi="sudo gem install"
alias gu="sudo gem uninstall"
alias gem_all="gem query --remote"
alias gem_search="gem query --remote --name-matches"

# editors
alias emacs='emacs -nw'
alias gvim='gvim -p'
e() { (test "$#" -eq 0) && $EDITOR . || $EDITOR $@ }

# shells
alias xterm='uxterm'
alias rxvt='urxvt +sb'
alias urxvt='urxvt +sb'

# git
alias gs="git status"
alias gci="git commit -a -m"
branch="git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'"
alias gom='git push origin $(branch)'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# irb
alias irb="irb --readline -r irb/completion"
alias irb1.9="/usr/local/bin/irb1.9 --readline -r irb/completion"

# others
alias ghist='history | egrep'
alias ghist="cat ~/.history | egrep"
alias nettest='ping -c 3 www.google.com'
alias append="cat >> "
alias unpack="for archiv in ./*.tar.* ; do tar xf $archiv ; done"
# kdyz chci otevrit vice konsoli v jedne slozce
alias mcd='pwd > ~/.dirclip' # vyvolam v puvodni
alias rcd='cd $(cat ~/.dirclip); pwd' # vyvolam v novem okne
alias last="tail -n 1"
alias first="head -n 1"
alias reload='cd `pwd`'
alias ...='cd ../..'
alias "."="cd ." # reload
alias dus='du -sh * | sort -rn | head'
alias d='ls -d */' # vypis adresare
alias re="ruby -e"
alias rpe="ruby -pe"

test_executable() {
  # If file exists => it's locally, not somewhere in $PATH
  # existuje a je spustitelny: eval
  # neexistuje a jakoby neni spustitelny: eval
  (test -f $1 && test -x $1) && eval $(interpret $1) || mate $1
}

interpret() {
  interpret=$(head -1 $1 | sed -E 's/^#!(.+)$/\1/')
  echo "$interpret '$1'"
}

edit() {
  return "mate '$1'"
  # TODO
  # test -f $1 && return $EDITOR
  # template=$CONF/ZSH/templates # etc
  # cp $template $1
}

# web
# for suffix in com org cz
#   do alias -s $suffix="open -a opera"
# done
alias -s {com,org,cz}="open -a opera"

# NOTE: pretty bad idea
# scripts
# for suffix in sh rb pl py
#   do alias -s $suffix="test_executable '$filename'"
# done
#alias -s {sh,rb,pl,py}="test_executable '$filename'"
# textmate
# for suffix in htm html js css haml erb rhtml rjs txt tex c cpp ru sql
#   do alias -s $suffix="eval edit '$filename'"
# done

alias -s {htm,html,js,css,haml,erb,rhtml,rjs,txt,tex,c,cpp,ru,sql}="mate '$filename'"

# /Applications
alias -s app="open"

# To use, save as .cap_completion.zsh in your home dir, and add "source ~/.cap_completion.zsh" to your .zshrc file
# 99% of this is ripped straight from http://weblog.rubyonrails.com/2006/3/9/fast-rake-task-completion-for-zsh
# Any broken stuff is probably mine.

_cap_does_task_list_need_generating () {
  if [ ! -f .cap_tasks ]; then return 0;
  else
    accurate=$(stat -f%m .cap_tasks)
    changed=$(stat -f%m config/deploy.rb)
    return $(expr $accurate '>=' $changed)
  fi
}

_cap () {
  if [ -f config/deploy.rb ]; then
    if _cap_does_task_list_need_generating; then
      echo "\nGenerating .cap_tasks..." > /dev/stderr
      cap show_tasks -q | cut -d " " -f 1 | sed -e '/^ *$/D' -e '1,2D' > .cap_tasks
    fi
    compadd `cat .cap_tasks`
  fi
}

compdef _cap cap

function _mategem {
    reply=($(ls "$(gem environment gemdir)/gems"))
}
compctl -K _mategem mategem.sh

# Project
# project Get
# project Get --ruby
function _project_types { reply=($(ls ~/Config/Projects/General | sed 's/\.rb$//' | sed 's/^/--/')) }
compctl -K _project_types project.rb

function _projects { reply=($(ruby -rterminal/helper -e 'puts Helper.completion')) }
# projit config/projects/general/*.rb => paths
compctl -K _projects project.rb
# compctl -K projects -K _project_types project

compdef _gnu_generic irb
compdef _gnu_generic rake
compdef _gnu_generic merb
compdef _gnu_generic merb-gen
compdef _gnu_generic thor

_gems()         { gem list $1 | awk '{ print $1 }' | egrep -v "^$|^\*+$" }
_gem_commands() { gem help commands | awk '{ print $1 }' }
_remote_gem()   { _gems --remote }
_local_gem()    { _gems --local }

compdef _remote_gem "gem install"

for command in _gem_commands ; do
  compdef _gnu_generic "gem $command"
done

# print -z foo





_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks ]; then return 0;
  else
    accurate=$(stat -f%m .rake_tasks)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks
    fi
    compadd `cat .rake_tasks`
  fi
}

compdef _rake rake

_thor() {
  compadd thor list | awk '{ print $1 }'
}

compdef _thor thor

export SHELL="/bin/zsh"

export EDITOR="mate"
export CVSEDITOR="mate -w"
export SVN_EDITOR="mate -w"
export GIT_EDITOR="mate -w"

# The less pager supports editing the file being viewed by pressing v. To setup TextMate to be used with less, you need to setup the LESSEDIT variable
export LESSEDIT='mate -l %lm %f'

# == RUBY == #
export RUBYOPT="rubygems"

# == SHELL == #
export CDPATH="$HOME/data/projects"
export MANPATH=/opt/local/share/man:$MANPATH

# == GREP == #
export GREP_OPTIONS='--color=auto' 
export GREP_COLOR='1;36'

path-add()        { path+=("$@") }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# PATH
path-add /opt/local/bin
path-add /Developer/usr/bin
projects=~/data/projects/sources
test -d $projects && path-add $projects/**/bin
test -d $projects/scripts && path-add $projects/scripts

typeset -T -U -gx -a RUBYLIB rubylib ':'

rubylib-add()    { rubylib+=("$@") }
rubylib-delete() { for i ("$@") { rubylib[(r)$i]=() } }
rubylib-clear()  { rubylib=() }

rubylib-clear

projects=~/data/projects/sources
test -d $projects && rubylib-add $projects/**/lib

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

simple_prompt() {
  case "$1" in
  on)  ls ;;
  off) ls ;;
  esac
  (test $UID -ne 0) && PROMPT="$ " || PROMPT="# "
  export PROMPT
  export RPS1=""
}

