#!/bin/bash
set -euo pipefail

sudo apt update -y
sudo apt install -y build-essential wget curl git vim pciutils

# Verify NVIDIA GPU
if ! lspci | grep -i nvidia; then
  echo "No NVIDIA GPU detected. Exiting."
  exit 1
fi

# conda installation
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
unlink ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all

# nodejs installation
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22

# Install Go (optional, uncomment if needed)
# wget https://go.dev/dl/go1.23.1.linux-amd64.tar.gz
# sudo rm -rf /usr/local/go
# sudo tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz
# rm go1.23.1.linux-amd64.tar.gz
# mkdir -p ~/go/bin

# Install Rust and crates
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
cargo install --locked bat
cargo install bottom --locked
cargo install dua-cli
cargo install --locked dysk
cargo install exa
cargo install ripgrep
cargo install --force yazi-build

# GPU monitoring
sudo apt install -y fzf nvtop

# Install code agents (requires Node.js)
npm install -g @anthropic-ai/claude-code
npm i -g @openai/codex

# Configure .bashrc (append if not present)
cat << EOF >> ~/.bashrc
export PATH=/usr/local/cuda/bin:$PATH
. "$HOME/.cargo/env"


HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
# shell appearance
export PS1='\e[1;34m\u\e[m@\e[1;32m\h\e[m:\[\e[33m\]\w\[\e[0m\]\$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LANG="en_US.UTF-8"
# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# CUDA installation
export LD_LIBRARY_PATH="/usr/local/cuda/lib64"
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib
export CUDA_INSTALL_PATH="/usr/local/cuda"

function y() {
local tmp="\$(mktemp -t "yazi-cwd.XXXXXX")" cwd
yazi "\$@" --cwd-file="\$tmp"
IFS= read -r -d '' cwd < "\$tmp"
[ -n "\$cwd" ] && [ "\$cwd" != "\$PWD" ] && builtin cd -- "\$cwd"
rm -f -- "\$tmp"
}

export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"
EOF

# Source .bashrc
source ~/.bashrc

echo "Setup complete."