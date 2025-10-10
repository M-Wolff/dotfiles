#! /usr/bin/env bash
# .bashrc additions for work PC "Wolffgang
alias todo="vim ~/Sciebo/ToDos.md"

PATH="/home/m_wolf37/.local/bin:$PATH"
PATH="$HOME/.local/bin/qemu-9.2.0/build:$PATH"
PATH="$HOME/.local/bin/podman/bin/:$PATH"
PATH="$HOME/.local/bin/gvproxy/:$PATH"
. "$HOME/.cargo/env"
PATH="$HOME/.local/bin/virtiofsd/target/release:$PATH"
PATH="$HOME/.local/bin/syncthing:$PATH"
PATH="/home/m_wolf37/.local/bin/nodejs-latest-install/node-v22.14.0-linux-x64/bin:$PATH"
PATH="/home/m_wolf37/tools/ollama/bin:$PATH"
PATH="/home/m_wolf37/.local/bin/vim_src/src:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/m_wolf37/.ghcup/env" ] && . "/home/m_wolf37/.ghcup/env" # ghcup-env
