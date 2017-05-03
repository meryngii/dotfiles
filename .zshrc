#!/bin/zsh

# Loads the local configuration.
[ -f $HOME/.zshrc.localenv ] && source $HOME/.zshrc.localenv

# Load zplug
source ~/.zplug/init.zsh

# Plugins managed by zplug
#zplug "plugins/git",   from:oh-my-zsh

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load plugins.
zplug load

# Set prompt.
PROMPT='%F{green}%n@%m%u%f %~ $ '

# Options (directories)
setopt auto_cd
setopt auto_pushd
setopt auto_resume
setopt extended_history
setopt pushd_ignore_dups

# Other options
setopt list_packed
setopt menu_complete
setopt auto_param_slash
setopt transient_rprompt

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Aliases
case "${OSTYPE}" in
darwin*)
    # For Mac OS X
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"
    ;;
linux*)
    # For Linux
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color'
    
    function open() {
        xdg-open "$*" &> /dev/null
    }
esac

alias l=ls
alias sl=ls

alias v=nvim
alias g=git
alias s=ssh

export LSCOLORS=ExFxCxDxBxegedabagacad

# Suffix Aliases
alias -s {png,jpg,bmp,PNG,JPG,BMP}=open
alias -s {htm,html}=open

function extract() {
    case $1 in
        *.tar.gz|*.tgz) tar xzvf $1;;
        *.tar.xz) tar Jxvf $1;;
        *.zip) unzip $1;;
        *.tar.bz2|*.tbz) tar xjvf $1;;
        *.tar.Z) tar zxvf $1;;
        *.gz) gzip -dc $1;;
        *.bz2) bzip2 -dc $1;;
        *.Z) uncompress $1;;
        *.tar) tar xvf $1;;
        *.arj) unarj $1;;
    esac
}
alias -s {gz,tgz,zip,bz2,tbz,Z,tar,arj,xz}=extract

# Load compinit.
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select


# Emacs key binding mode
bindkey -e

# Ctrl-P, Ctrl-N: Search history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# Home, End, Delete
bindkey "^[OH"  beginning-of-line # 'Home'
bindkey "^[OF"  end-of-line       # 'End'
bindkey "^[[3~" delete-char       # 'Delete'

# Ctrl-O, Ctrl-U: Go back/forward to visited directories
function cdforward() {
    if [ ! -z "$forwardlist" ]; then
        cd $forwardlist[1]
        shift forwardlist
        zle reset-prompt
    fi
}
function cdback() {
    if [ ! -z "$(dirs)" ]; then
        if [ ! -z "$forwardlist" ]; then
            if [ $(pwd) = $forwardlist[1] ]; then
                return
            fi
        fi
        forwardlist=($(pwd) $forwardlist)
        popd > /dev/null 2>&1 && zle reset-prompt
    fi
}
zle -N cdforward
bindkey "^u" cdforward
zle -N cdback
bindkey "^o" cdback

## less coloring
##case "${OSTYPE}" in
##darwin*)
##    LESSPIPE=`brew --prefix source-highlight 2>/dev/null`/bin/src-hilite-lesspipe.sh
##    ;;
##*)
##    LESSPIPE="src-hilite-lesspipe.sh"
##    ;;
##esac
#
##if type ${LESSPIPE} >/dev/null 2>&1; then
##    export LESS='-R'
##    export LESSOPEN="| ${LESSPIPE} %s"
##fi
#
##case "${OSTYPE}" in
##darwin*)
##    # For Mac OS X
##    #export PATH="/usr/local/bin:$PATH"
##    ;;
##esac

# Loads the local configuration.
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local


