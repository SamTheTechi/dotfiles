# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH=/usr/share/oh-my-zsh/
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Plugins used
plugins=( git zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# helper function
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# power10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# alias
alias ls='ls --color=auto'
alias :q='exit'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias cd..='cd ..'
alias lf='yazi'
alias nv='nvim .'
alias ld='lazydocker'
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
export ANDROID_HOME=$HOME/.android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH
export PATH=$PATH:/home/Asuna/.spicetify
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Load Angular CLI autocompletion.
# source <(ng completion script)
POWERLEVEL9K_INSTANT_PROMPT=quiet

