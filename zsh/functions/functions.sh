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

function path-grep() {
  dirs=${PATH//:/\ }
  find $(echo $dirs) | egrep $1
}
