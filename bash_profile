#!/bin/bash

source "$(dirname ${BASH_SOURCE[0]})/bash_PATH_mod.sh"

complete -C '/usr/local/bin/aws_completer' aws

if [[ -z $TMUX ]]; then
  if [ -d "${HOME}/.rvm" ]; then
    echo "~/.rvm exists"
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  fi
fi

echo "~/dotfiles/bash_profile direct actions"
export GOENV_ROOT="$HOME/.goenv"
pathprepend "$GOENV_ROOT/bin"
export GOENV_DISABLE_GOPATH=1
pathprependbin "$GOENV_ROOT"
eval "$(goenv init -)"
pathaddbin "$(go env GOPATH)" # at the end for security
