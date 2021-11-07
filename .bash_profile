export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@3.9/libexec/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/usr/local/bin/go:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

export PS1='\e[1;34m\u\e[m@\e[1;32m\h\e[m:\[\e[33m\]\w\[\e[0m\]\$ '

eval "$(jenv init -)"

jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export leveldb_version=$(ls /usr/local/Cellar/leveldb@1.22/ | tail -1)


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -G'
alias config='/usr/bin/git --git-dir=/Users/antonio/.cfg/ --work-tree=/Users/antonio'
