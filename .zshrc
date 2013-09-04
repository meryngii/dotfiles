# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/denjo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz colors
colors

setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"

  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  ;;
esac


#alias -g L='| less'
#alias -g H='| head'
#alias -g T='| tail'
#alias -g G='| grep'
#alias -g GI='| grep -i'

### PROMPT ###
PROMPT='%n@%m%# '
RPROMPT="%{$fg[red]$bg[white]%} %d %{$reset_color%}"
setopt TRANSIENT_RPROMPT
setopt LIST_PACKED
setopt ALWAYS_TO_END
setopt PRINT_EIGHT_BIT
#PROMPT="%{$fg[red]%}%m%{$fg[white]%}:%{$fg[green]%}%n%{$fg[white]%}:%{$fg[blue]%}%~%{$fg[white]%}$%{$reset_color%} "

### Key Bindings ###
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

bindkey "^[OH"  beginning-of-line # 'Home'
bindkey "^[OF"  end-of-line       # 'End'
bindkey "^[[3~" delete-char       # 'Delete'

zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

