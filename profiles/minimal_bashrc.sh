export PATH="/usr/local/cuda/bin:$PATH"

HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# shell appearance
export PS1='\e[1;34m\u\e[m@\e[1;32m\h\e[m:\[\e[33m\]\w\[\e[0m\]\$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export EDITOR='nvim' temporally disabled
# language environment variables
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
# general aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# CUDA installation
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"