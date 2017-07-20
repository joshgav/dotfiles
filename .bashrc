SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export EDITOR=vi
set -o vi
/bin/bash ${SCRIPT_DIR}/scripts/init_vim.sh # --no-update

function clear () {
  if [ -n ${TMUX+x} ]; then
    tmux clear-history
  fi
  /usr/bin/clear
}

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

alias ll='ls -alhF --group-directories-first'

# add this line to ~/.vimrc to activate:
# TODO: add to scripts/init_vim.sh
# `if !empty($SHARED_VIMRC) | source $SHARED_VIMRC | endif`
export SHARED_VIMRC=${SCRIPT_DIR}/.vimrc

# TODO: move to separate script
git config --global alias.st 'status -sb'
git config --global user.email 'joshgavant@gmail.com'
git config --global user.name 'Josh Gavant'
