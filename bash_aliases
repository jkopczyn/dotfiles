#!/bin/bash

alias cls='printf "\ec"'
alias reset='printf "\ec"'
# These print '<ESC>c', the terminal reset code

alias irb='pry'
alias be="bundle exec"
alias ber="bundle exec rspec"

alias chrome="google-chrome"

#Useful for single-author projects written on a shared account, as in aA
#Very specific use-case, but saves a great deal of time there
alias fixauthorship="git filter-branch -f --env-filter \"GIT_AUTHOR_NAME='Jacob Kopczynski'; GIT_AUTHOR_EMAIL='ja.kopczynski@gmail.com'; GIT_COMMITTER_NAME='Jacob Kopczynski'; GIT_COMMITTER_EMAIL='ja.kopczynski@gmail.com';\" HEAD"

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
#for rapid applications
alias cover="pdflatex -interaction scrollmode JacobKopczynskiCoverLetter.tex"

if [ -f ~/Code/bashrc/test_aliases ]; then
  . ~/Code/bashrc/test_aliases
fi
