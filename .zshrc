# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="jreese"

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
plugins=(git)

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

case "${OSTYPE}" in
darwin*)
    # For Mac OS X
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"

    path=(${path} /Applications/Inkscape.app/Contents/MacOS/(N-/))
    path=(${path} /Applications/Maxima.app/Contents/Resources/(N-/))

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
esac

# Aliases
alias ]="open"

# Suffix Aliases
alias -s {png,jpg,bmp,PNG,JPG,BMP}=eog
alias -s {htm,html}=chrome

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

zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# vi Keybinding mode
bindkey -v

bindkey -v '^Y' push-line

bindkey "^p" history-beginning-search-backward-end # Ctrl + p
bindkey "^n" history-beginning-search-forward-end  # Chrl + n

bindkey "^[OH"  beginning-of-line # 'Home'
bindkey "^[OF"  end-of-line       # 'End'
bindkey "^[[3~" delete-char       # 'Delete'


