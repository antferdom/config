export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

PS1="%F{57}%n%f@%F{118}%m%f %F{226}%1~%f %#"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -G'
alias breww='arch -x86_64 /usr/local/homebrew/bin/brew'
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

