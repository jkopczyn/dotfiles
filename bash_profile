#!/bin/bash

#echo 'dotfiles/bash_profile being executed'

complete -C '/usr/local/bin/aws_completer' aws

aws-mfa

if [[ -z $TMUX ]]; then
  #export GOPATH="$GOPATH:$HOME/chromiumos/infra/lucifer:$HOME/chromiumos/src/config:$HOME/chromiumos/src/platform/tast"
  #export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  export PATH="${PATH}:$HOME/.local/cipd:export PATH=$PATH:$HOME/chromiumos/infra/lucifer/bin"
  # [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

