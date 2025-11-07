We want to fully automate using **bash scripts** the configuration of a new GPU VM instance, **Ubuntu** as OS, with default system `.bashrc` and settings. We have manually curated our desired target system configuration, which includes:

- CUDA installation and environment variables (see `.bashrc`)

- [miniconda installation](https://www.anaconda.com/docs/getting-started/miniconda/install#linux-2)

- [Nodejs installation](https://nodejs.org/en/download)

- (Optional) [Go installation](https://go.dev/doc/install)

- Rust installation `curl https://sh.rustup.rs -sSf | sh` , and **command lines utilities** written in Rush using **cargo** as installer. Those crates are:
  - [bat](https://github.com/sharkdp/bat): `cargo install --locked bat`
  - [bottom](https://github.com/ClementTsang/bottom): `cargo install bottom --locked`
  - [dua](https://github.com/Byron/dua-cli): `cargo install dua-cli`
  - [dysk](https://github.com/Canop/dysk): `cargo install --locked dysk`
  - [exa](https://github.com/ogham/exa): `cargo install exa`
  - [ripgrep](https://github.com/BurntSushi/ripgrep): `cargo install ripgrep`
  - [yazi](https://github.com/sxyazi/yazi): `cargo install --force yazi-build`
  
- Relevant **apt packages**:
  - [fzf](https://github.com/junegunn/fzf): `sudo apt install fzf`
  
- **Linux monitoring:**

  - [nvtop](https://github.com/Syllo/nvtop): `sudo apt install nvtop`

  - [nvitop](https://github.com/nicolargo/glances): `pip install --user glances`

  - [bottom](https://github.com/ClementTsang/bottom): `cargo install bottom --locked`

  - [bandwhich](https://github.com/imsnif/bandwhich): 

  - [glances](https://github.com/nicolargo/glances): `pip install --user glances`

- Code agents
  - [claude-code](https://docs.claude.com/en/docs/claude-code/settings): `npm install -g @anthropic-ai/claude-code`
  - [https://github.com/openai/codex](https://github.com/openai/codex): `npm i -g @openai/codex`

`.bashrc`:

```bash
export PATH=/usr/local/cuda/bin:$PATH
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

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
# export EDITOR='nvim' neovim configuration
# language environment variables
export LANG="en_US.UTF-8"
# general aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# CUDA installation
export LD_LIBRARY_PATH="/usr/local/cuda/lib64"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export CUDA_INSTALL_PATH="/usr/local/cuda"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/antonio/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/antonio/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/antonio/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/antonio/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

```

