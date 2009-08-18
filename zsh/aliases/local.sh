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
alias du='du -h --max-depth=1'

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
alias mvim='mvim -p'
e() { (test "$#" -eq 0) && $EDITOR . || $EDITOR $@ }

# shells
alias xterm='uxterm'
alias rxvt='urxvt +sb'
alias urxvt='urxvt +sb'

# git
alias gst="git status"

alias gc="git commit"
alias gcm="git commit -m"
alias gcv="git commit -v"
alias gcam="git commit -a -m"
alias gcav="git commit -a -v"

alias gd="git diff"
alias gdm="git diff | mate"
alias gl="git log"
alias gb="git branch"
alias gco="git checkout"
alias gp="git push"
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
