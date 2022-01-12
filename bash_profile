#!/bin/bash

#echo 'dotfiles/bash_profile being executed'

complete -C '/usr/local/bin/aws_completer' aws

if [[ -z $TMUX ]]; then
  #set up fasd
  eval "$(fasd --init auto)"
  if [ -d "${HOME}/.rvm" ]; then
    echo "~/.rvm exists"
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  fi
fi

