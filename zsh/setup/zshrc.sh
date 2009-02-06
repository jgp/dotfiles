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
