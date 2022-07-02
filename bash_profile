#!/bin/bash

if [[ -n $TMUX ]] && [[ "$(uname -s)"  =~ ^Darwin* ]]; then
    # /etc/profile causes PATH contortion on OSX in login shells
    # better to just detect that and start from empty
	if [ -f /etc/profile ]; then
		PATH=""
		source /etc/profile
	fi
fi

source "$(dirname ${BASH_SOURCE[0]})/bash_PATH_mod_funcs.sh"

complete -C '/usr/local/bin/aws_completer' aws

if [[ -z $TMUX ]]; then
  if [ -d "${HOME}/.rvm" ]; then
    echo "~/.rvm exists"
    pathaddbin "$HOME/.rvm" # Add RVM to PATH for scripting
    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  fi
fi

export GOENV_ROOT="$HOME/.goenv"
pathprependbin "$GOENV_ROOT"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"

if [[ -n $(go env GOPATH) ]]; then
	pathaddbin "$(go env GOPATH)" # at the end of the list for security
fi
