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