#! /usr/bin/env bash

this_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
source ${this_dir}/scripts/vscode.sh

export XDG_CONFIG_HOME=${HOME}/.config
export PS1='\u \w \$ '
export LESS=eFRX

export EDITOR=vi
set -o vi
${this_dir}/scripts/init_vim.sh # --update

function clear () {
    if [ -n ${TMUX+x} ]; then
        tmux clear-history
    fi
    /usr/bin/clear
}

if [ `uname` == 'Darwin' ]; then
  alias ll='ls -AlhF'
else
  alias ll='ls -AlhF --group-directories-first'
fi

PATH=${HOME}/.local/bin:${PATH}

# vi
export SHARED_VIMRC=${this_dir}/.vimrc
echo 'if !empty($SHARED_VIMRC) | source $SHARED_VIMRC | endif' > ~/.vimrc

# git
git config --global alias.st 'status -sb'
git config --global user.email 'joshgavant@gmail.com'
git config --global user.name 'Josh Gavant'

# node.js/nvm
export NVM_DIR="${HOME}/.nvm"
if [[ -e "${NVM_DIR}/nvm.sh" ]]; then
  source ${NVM_DIR}/nvm.sh
  source ${NVM_DIR}/bash_completion
  PATH=${HOME}/.yarn/bin:${PATH}
fi

# go
if [[ -x "/usr/local/go/bin/go" ]]; then
  GOROOT=/usr/local/go
  GOBIN=${GOROOT}/bin
  GOPATH=${HOME}/go
  PATH=${GOBIN}:${GOPATH}/bin:${PATH}
fi

# krew
if [[ -d ${HOME}/.krew ]]; then
  PATH=${HOME}/.krew/bin:${PATH}
fi

# XDG_RUNTIME_DIR == %t in systemd unit files
export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent.sock

# start SSH agent
eval $(ssh-agent -s) > /dev/null

echo "source-file ${this_dir}/.tmux.conf" > ~/.tmux.conf

