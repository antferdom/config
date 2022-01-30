export PATH="/usr/local/homebrew/bin:$PATH" # Brew installed binaries under Rosetta 2 translation
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"

PS1="%F{57}%n%f@%F{118}%m%f %F{226}%1~%f %#"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -G'
alias breww='arch -x86_64 /usr/local/homebrew/bin/brew'
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias grep='grep --color=always'
# gcc aliases
alias g++="g++-11"
alias gcc="gcc-11"
