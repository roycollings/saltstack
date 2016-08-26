source ~/.antigen.zsh

alias ls=' ls'
alias cd=' cd'

# Useful aliases
alias dc='docker-compose'
alias dps='docker ps --format="table {{{ .ID }}\t{{ .Names }}\t{{ .Image }}\t{{ .Status }}\t{{ .Command }}"'

alias tree='tree -d -I "vendor|cache|log|logs"'

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

# Remove 0.4 second delay between vi modes and have a 0.1 delay
export KEYTIMEOUT=1

# Antigen
antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle felixr/docker-zsh-completion
antigen bundle git-flow

#POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(load battery time)

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply
