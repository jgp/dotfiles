# test_executable() {
#   # If file exists => it's locally, not somewhere in $PATH
#   # existuje a je spustitelny: eval
#   # neexistuje a jakoby neni spustitelny: eval
#   (test -f $1 && test -x $1) && eval $(interpret $1) || mate $1
# }
# 
# interpret() {
#   interpret=$(head -1 $1 | sed -E 's/^#!(.+)$/\1/')
#   echo "$interpret '$1'"
# }
# 
# edit() {
#   return "mate '$1'"
#   # TODO
#   # test -f $1 && return $EDITOR
#   # template=$CONF/ZSH/templates # etc
#   # cp $template $1
# }
# 
# # web
# # for suffix in com org cz
# #   do alias -s $suffix="open -a opera"
# # done
# alias -s {com,org,cz}="open -a opera"
# 
# # NOTE: pretty bad idea
# # scripts
# # for suffix in sh rb pl py
# #   do alias -s $suffix="test_executable '$filename'"
# # done
# #alias -s {sh,rb,pl,py}="test_executable '$filename'"
# # textmate
# # for suffix in htm html js css haml erb rhtml rjs txt tex c cpp ru sql
# #   do alias -s $suffix="eval edit '$filename'"
# # done
# 
# alias -s {htm,html,js,css,haml,erb,rhtml,rjs,txt,tex,c,cpp,ru,sql}="mate '$filename'"
# 
# # /Applications
# alias -s app="open"
