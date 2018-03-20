# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
  export ZSH=/home/jarno/.oh-my-zsh
  export EDITOR='nvim'
  export TERM=xterm-256color
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Tmuxinator
source ~/.bin/tmuxinator.zsh

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

alias home="cd ~"
alias v="nvim"
alias work="mux start workspace"
alias ebike="mux start ebike"
alias terveys="mux start terveys"

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
