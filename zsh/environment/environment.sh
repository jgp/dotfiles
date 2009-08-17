export SHELL="/bin/zsh"

export EDITOR="mvim"
#export GIT_EDITOR="mate -w"
export GIT_EDITOR="vim"

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
