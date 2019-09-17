#!/bin/bash

#a git-stored supplement for ~/.bashrc
#should be kept normally in ~/dotfiles/bashrc
#~/.bashrc should include this snippet
#if [ -f ~/dotfiles/bashrc ]; then
#  . ~/dotfiles/bashrc
#fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#set up fasd
eval "$(fasd --init auto)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias fixssh='export $(tmux show-environment | grep \^SSH_AUTH_SOCK=)'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/dotfiles/bash_aliases ]; then
    . ~/dotfiles/bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export GOPATH="$GOPATH:/usr/local/google/home/jkop/chromiumos/infra/lucifer"

export EDITOR='vim'

#macro for quick git initialization
alias gitmakeremote="bash $HOME/dotfiles/gitmakeremote.sh"

/usr/local/google/home/jkop/chops/infra/go/env.py > /usr/local/google/home/jkop/chops/infra/go/env.sh
source /usr/local/google/home/jkop/chops/infra/go/env.sh
rm /usr/local/google/home/jkop/chops/infra/go/env.sh

#start or join tmux session
mux
