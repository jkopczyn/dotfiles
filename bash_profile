#!/bin/bash

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

# /etc/profile causes PATH contortion on OSX in login shells
# which doesn't play nice with goenv
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
	#do nothing
	;;
    Darwin*)
	# need to override the nonsense OSX does to change PATH when starting tmux
	if [[ -n $TMUX ]]; then
		export PATH="/Users/jkop/.goenv/shims:/Users/jkop/.goenv/bin:$PATH"
	fi
    ;;
    *)
	echo "UNKNOWN OS, PATH MAY BE UNSTABLE"
esac

if [[ -n $(go env GOPATH) ]]; then
	pathaddbin "$(go env GOPATH)" # at the end of the list for security
fi
