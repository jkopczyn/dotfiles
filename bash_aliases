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

alias ga="git add"
alias gaa="git add -A"
alias gaas="git add -A ; git status"
alias gits="git status"
alias gis="git status"
alias gitp="git push"
alias gip="git push"
alias gp="git push"
alias gitd="git diff"
alias gid="git diff"
alias gd="git diff"
alias gdh="git diff HEAD -- "
alias gpu="git push --set-upstream origin master"
alias gitm="git commit -m"
alias gim="git commit -m"
alias gitb="git branch"
alias gib="git branch"
alias gb="git branch"
alias gitl="git log"
alias gil="git log"
alias gl="git log"
alias gap="git add -p"
alias prereview="git diff origin/master..."

alias gph="git push heroku master"

alias ptex="pdflatex -interaction scrollmode"

pythonmakedir() {
    mkdir "$@"
    touch "$@/__init__.py"
}
alias pmd="pythonmakedir"

if [ -f ~/bin/bashrc/test_aliases ]; then
  . ~/bin/bashrc/test_aliases
fi
