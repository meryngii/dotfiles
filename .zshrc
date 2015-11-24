# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="jreese"

# Loads the local configuration.
[ -f $HOME/.zshrc.localenv ] && source $HOME/.zshrc.localenv

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew)

case "${OSTYPE}" in
darwin*)
    plugins=(git svn autojump brew trash)
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
    ;;
linux*)
    plugins=(git svn autojump debian)
    [[ -s /usr/share/autojump/autojump.zsh ]] && . /usr/share/autojump/autojump.zsh
    ;;
esac

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Directory
setopt auto_cd
setopt auto_pushd
setopt auto_resume
setopt extended_history
setopt pushd_ignore_dups

#function chpwd() {
#    emulate -L zsh
#    autojump -a $pwd
#    echo $pwd > ~/.curdir
#}

case "${OSTYPE}" in
darwin*)
    # For Mac OS X
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"

    alias chrome='open -a Google\ Chrome'

    ;;
linux*)
    # For Linux
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    
    function open() {
        xdg-open "$*" &> /dev/null
    }
    
    ;;
cygwin*)
    alias open=cygstart
esac

alias l=ls
alias sl=ls

# Aliases
alias ]="open"
alias v="vim"
alias p="popd"

# Suffix Aliases
alias -s {png,jpg,bmp,PNG,JPG,BMP}=open
alias -s {htm,html}=open

function extract() {
    case $1 in
        *.tar.gz|*.tgz) tar xzvf $1;;
        *.tar.xz) tar Jxvf $1;;
        *.zip) unzip $1;;
        *.lzh) lha e $1;;
        *.tar.bz2|*.tbz) tar xjvf $1;;
        *.tar.Z) tar zxvf $1;;
        *.gz) gzip -dc $1;;
        *.bz2) bzip2 -dc $1;;
        *.Z) uncompress $1;;
        *.tar) tar xvf $1;;
        *.arj) unarj $1;;
    esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

function runc() {
    gcc -O3 $1 &&
    shift &&
    ./a.out $@
}
alias -s c=runc
function runcpp() {
    g++-4.8 -O3 -std=c++11 $1 &&
    shift &&
    ./a.out $@
}
alias -s cpp=runcpp

alias -s hs=runhaskell
alias -s ml=ocaml
alias -s py=python

#setopt correct
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*' tag-order local-directories

# Packs completion.
setopt list_packed

setopt menu_complete
setopt auto_param_slash # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える

# Emacs key binding mode
bindkey -e

export KEYTIMEOUT=1

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

bindkey '^r' history-incremental-search-backward

bindkey "^[OH"  beginning-of-line # 'Home'
bindkey "^[OF"  end-of-line       # 'End'
bindkey "^[[3~" delete-char       # 'Delete'

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

# expand-or-complete-or-list-files
function expand-or-complete-or-list-files() {
    if [[ $#BUFFER == 0 ]]; then
        BUFFER="ls "
        CURSOR=3
        zle list-choices
        zle backward-kill-word
    else
        zle expand-or-complete
    fi
}
zle -N expand-or-complete-or-list-files
# bind to tab
bindkey '^I' expand-or-complete-or-list-files
#function zle-line-init zle-keymap-select {
#    case $KEYMAP in
#    vicmd)
#        RPROMPT="[NORMAL]"
#        ;;
#    main|viins)
#        RPROMPT="[INSERT]"
#        ;;
#    esac
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

setopt TRANSIENT_RPROMPT

# less coloring
case "${OSTYPE}" in
darwin*)
    LESSPIPE=`brew --prefix source-highlight 2>/dev/null`/bin/src-hilite-lesspipe.sh
    ;;
*)
    LESSPIPE="src-hilite-lesspipe.sh"
    ;;
esac

if type ${LESSPIPE} >/dev/null 2>&1; then
    export LESS='-R'
    export LESSOPEN="| ${LESSPIPE} %s"
fi

case "${OSTYPE}" in
darwin*)
    # For Mac OS X
    #export PATH="/usr/local/bin:$PATH"
    ;;
esac

# Loads the local configuration.
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

#cd `cat ~/.curdir`

