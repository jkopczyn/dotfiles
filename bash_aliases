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
alias gas="git add -A ; git status"
alias gits="git status"
alias gis="git status"
alias gitp="git push"
alias gip="git push"
alias gp="git push"
alias gitd="git diff"
alias gid="git diff"
alias gd="git diff"
alias gdh="git diff HEAD -- "
alias gdh^="git diff HEAD^"
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
alias gitco="git checkout"
alias gco="git checkout"
alias gico="git checkout"
alias gitr="git reset"
alias gir="git reset"
alias gr="git reset"
alias gic="git commit"
alias gc="git commit"
alias rebase="git rebase"
alias rebi="git rebase -i"
alias giri="git rebase -i"
alias gri="git rebase -i"
alias gica="git commit --amend"
alias gca="git commit --amend"

alias ru="repo upload"
alias rr="repo rebase"
alias rs="repo sync"
alias rsu="repo sync; repo rebase; repo upload ."
alias rco="repo checkout"
alias rb="repo branch"

alias gph="git push heroku master"

alias ptex="pdflatex -interaction scrollmode"

alias v='f -e vim'

pythonmakedir() {
    mkdir "$@"
    touch "$@/__init__.py"
}
alias pmd="pythonmakedir"

if [ -f ~/bin/bashrc/test_aliases ]; then
  . ~/bin/bashrc/test_aliases
fi
