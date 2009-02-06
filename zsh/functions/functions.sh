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
