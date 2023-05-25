export PATH="/usr/local/homebrew/bin:$PATH" # Brew installed binaries under Rosetta 2 translation
export PATH="/opt/homebrew/bin:$PATH" # Brew native ARM installed binaries
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH" # openssl@3
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH" # Python
. "$HOME/.cargo/env" # Rust
export PATH="/opt/homebrew/opt/ruby/bin:$PATH" # Ruby
export PATH="/opt/homebrew/opt/llvm/bin:$PATH" # LLVM
export PATH="/opt/homebrew/anaconda3/bin:$PATH" # Anaconda Python
# shell appearance
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
alias g++="g++-12"
alias gcc="gcc-12"
# compilers
export CC=clang
export CXX=clang++
# llvm
# export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib" # unsafe
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/antonio/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/antonio/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/antonio/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/antonio/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Ruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh # auto-switching of Rubies specified by .ruby-version files
# Gems target directory
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/antonio/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
