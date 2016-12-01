#!/bin/bash

alias cls='printf "\ec"'
alias reset='printf "\ec"'
# These print '<ESC>c', the terminal reset code

alias irb='pry'
alias be="bundle exec"
alias brake="bundle exec rake"
alias brails="bundle exec rails"
alias ber="bundle exec rspec"

alias chrome="google-chrome"

backbonegenerate() {
  bundle exec rails g backbone:scaffold "$@" --javascript
}
backbonedestroy() {
  bundle exec rails d backbone:scaffold "$@" --javascript
}
alias brbbg="backbonegenerate"
alias brbbd="backbonedestroy"

alias hrake="heroku run rake"

alias gaa="git add -A"
alias gaam="git add -A ; git commit -m"
alias gaas="git add -A ; git status"
alias gits="git status"
alias gitp="git push"

alias gph="git push heroku master"

alias ptex="pdflatex -interaction scrollmode"

if [ -f ~/bin/bashrc/test_aliases ]; then
  . ~/bin/bashrc/test_aliases
fi
