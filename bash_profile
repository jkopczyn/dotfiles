#!/bin/bash

#echo 'dotfiles/bash_profile being executed'

complete -C '/usr/local/bin/aws_completer' aws

if [[ -z $TMUX ]]; then
  if [ -d "${HOME}/.rvm" ]; then
    echo "~/.rvm exists"
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  fi
fi

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
