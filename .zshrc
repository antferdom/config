export PATH="/usr/local/homebrew/bin:$PATH" # Brew installed binaries under Rosetta 2 translation
export PATH="/opt/homebrew/bin:$PATH" # Brew native ARM installed binaries 
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH" 
. "$HOME/.cargo/env"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

PS1="%F{57}%n%f@%F{118}%m%f %F{226}%1~%f %#"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export EDITOR='nvim' temporally disabled
# language environment variables
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
# general aliases
alias ls='ls -G'
alias breww='arch -x86_64 /usr/local/homebrew/bin/brew'
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias grep='grep --color=always'
# gcc aliases
alias g++="g++-11"
alias gcc="gcc-11"
# compilers
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
