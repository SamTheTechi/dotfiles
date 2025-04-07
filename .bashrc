
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:/.bun/bin:$PATH"
export PATH="$PATH:/.npm/bin:$PATH"


PS1='\[$(tput setaf 196)\]\u\[$(tput setaf 196)\]@\[$(tput setaf 214)\]\h \[$(tput setaf 33)\]\w \[$(tput sgr0)\]$'

alias :q='exit'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cd..='cd ..'
alias lf='yazi'
mkdirg(){
  mkdir -p "$1"
  cd "$1"
}


pokemon-colorscripts --no-title -r 1,3,6
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
source ~/.nvm/nvm.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/home/Asuna/.bun/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
