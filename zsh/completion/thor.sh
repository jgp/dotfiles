_thor() {
  compadd thor list | awk '{ print $1 }'
}

compdef _thor thor