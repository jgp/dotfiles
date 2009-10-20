# mv, cp, rm
alias cp='cp -i'
alias mv='mv -i'
alias rmr="rm -r"
alias rmf="rm -f"
alias rmrf="rm -rf"

# df, du
alias df='df -h'
#alias du='du -h --max-depth=1'
du() {
  for item in $* ; do
    /usr/bin/du -h $item | tail -1
  done
}

# cd
alias .='cd .' # reload (e.g.: you're in app/current)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# gem
alias gi="sudo gem install --no-user-install --no-rdoc --no-ri --no-wrappers --no-test --env-shebang"
alias gu="sudo gem uninstall"
alias gem_all="gem query --remote"
alias gem_search="gem query --remote --name-matches"

# editors

# e() { (test "$#" -eq 0) && $EDITOR . || $EDITOR $@ }
e() { (test "$#" -eq 0) && mvim . || mvim -p $@ }

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
alias irb1.9="irb1.9 --readline -r irb/completion"

# others
alias ghist="cat $HISTFILE | egrep"
alias nettest='ping -c 3 www.google.com'
alias append="cat >> "
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
