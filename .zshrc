#################### Aliases ###############################
alias ls='ls -G'        # Compact view, show colors
alias ll='ls -alh'
alias l='ls -a'
alias c='clear'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories

alias h='history' # Shell History

bindkey -v    # Enables vi keybindings
alias vimmode='bindkey -v'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# IP addresses
alias localip="ipconfig getifaddr en0"

# pipe into this function to pretty print json
alias prettyjson='python -m json.tool'

#vim aliases
alias vi="nvim"
alias vim="nvim"

#cheat man page lookup
function cheat () {
    curl "cheat.sh/$1"
  }

################### Dev Settings #########################

#git
export GIT_EDITOR=nvim

#source machine specific settings
if [ -f ./.zshrclocal ]; then
   source ./.zshrclocal 
fi

################### Basic Settings #######################

# set fallback prompt
PS1='%F{blue}%B%~%b%f %F{green}❯%f '

#Set up history
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=100000
setopt inc_append_history
alias history='history -10000'

#load completions
autoload -U compinit && compinit

precmd () { print -Pn "\e]2;%-3~\a"; }


##################### Theme #############################
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
