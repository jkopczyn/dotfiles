#!/bin/bash

alias dotfiles='vim ~/dotfiles/bash_aliases && source ~/dotfiles/bash_aliases'

function drive {
  echo "Drive folder active until this process ends.";
  drive_fs -noui --console_auth ~/drive/ |& cat >> ~/drive.log;
  echo "Drive folder no longer active.";
}

alias cls='printf "\ec"'
alias reset='printf "\ec"'
# These print '<ESC>c', the terminal reset code

#alias irb='pry'
alias be="bundle exec"
alias brake="bundle exec rake"
alias brails="bundle exec rails"
alias ber="bundle exec rspec"

alias chrome="google-chrome"

alias hrake="heroku run rake"

alias ga="git add"
alias ga.="git add ."
alias gaa="git add -A"
alias gaas="git add -A ; git status"
alias gas="git add -A ; git status"
alias gis="git status"
alias gsh="git show"
alias gp="git push"
alias gd="git diff"
alias gdh="git diff HEAD -- "
alias gdhn="git diff HEAD --name-only -- "
alias gdh^="git diff HEAD^"
alias gdhn^="git diff HEAD^ --name-only -- "
alias gdh^n="git diff HEAD^ --name-only -- "

function vgdh {
  args='';
  while IFS= read -r -d '' file; do
    args="${args} $file";
  done < <(git diff HEAD^ --name-only -z)
  printf '%q\n' "$args";
  vim $args;
}

function gd^ { git diff "$1"^ "$@"; }
alias gdn="git diff --name-only -- "
alias gpu="git push --set-upstream origin master"
alias gim="git commit -m"
alias gb="git branch"
alias gl="git log"
alias gl1="git log -1"
alias gl2="git log -2"
alias gl3="git log -3"
alias gl4="git log -4"
alias gl5="git log -5"
alias gl6="git log -6"
alias gl7="git log -7"
alias gl8="git log -8"
alias gl9="git log -9"
alias gap="git add -p"
alias gco="git checkout"
alias gco^="git checkout HEAD^"
alias gcoh="git checkout HEAD^"
alias gcoh^="git checkout HEAD^"
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
function gga { git log --all --grep="$1"; }
alias vgdh^n='vim $(gdh^n)'
alias vgdn='vim $(gdn)'

alias ru="repo upload"
alias ru.="repo upload ."
alias rr="repo rebase ."
alias rr.="repo rebase ."
alias rs="repo sync"
alias rs.="repo sync ."
alias rsu="repo sync; repo rebase; repo upload ."
alias rsu.="repo sync .; repo rebase .; repo upload ."
function rco() { { repo checkout "$@" 2> /dev/null || repo start "$@"; } && echo "on branch $1";}
alias rb="repo branch . || repo branch"
alias rba="repo branch"
alias rst="repo start"
alias ra="repo abandon"
alias rp="repo prune"

alias roles="vim ~/chromiumos/chromeos-admin/puppet/facterlib/server_type.rb"

rebase_all() {
  cd ${1-''}
  for branch in $(git branch | cut -c 3-);
  do
    gco $branch
    rr.
  done
}
alias rra="rebase_all"

function rrra() { repo forall -c rebase_all `pwd`; }

foo() {
  cd ${1-'.'};
  echo 'success'
}

function rrre() { repo forall -c foo `pwd`; }

alias ta="tmx2 attach -d || tmux attach -d"
alias tm="tmx2 || tmux"

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
