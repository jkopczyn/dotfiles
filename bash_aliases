#!/bin/bash

function cpl {
  cp "$1" lib
}

function cda {
  builtin cd "$@" && fasd -A .;
}
alias cd="cda"

alias dotfiles='vim ~/dotfiles/bash_aliases && source ~/dotfiles/bash_aliases'

function git-branch-last-commit {
  git branch "$@" | grep --line-buffered -v '/HEAD' | while read branch; do
    git log -n1 --format="format:%C(auto)%D%Creset - %s %Cgreen(%ar)%Creset %C(bold blue)<%an>%n" "${branch/* /}"
  done
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
alias gbd="git branch -d"
alias gcu="git cl upload"
alias gcd="git cl description"
alias gcm="git cl description"
alias gca="git cl archive"
alias gd="git diff"
alias gdh="git diff HEAD -- "
alias gdh^="git diff HEAD^"
alias gdhn="git diff HEAD^ --relative --name-only -- "
alias gf="git fetch"
alias gis="git status"
alias gsh="git show"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsa="git stash apply"
alias gsl="git stash list"
alias g="git"

function gsp {
  case $1 in
    +(0-9))
      git stash pop "stash@{$1}"
      ;;
    *)
      git stash pop $1
      ;;
  esac
}

function vgdh {
  args='';
  while IFS= read -r -d '' file; do
    args="${args} $file";
  done < <(git diff HEAD^ --relative --name-only -z $@)
  printf '%q\n' "$args";
  vim $args;
}

function gd^ { git diff "$1"^ "$@"; }
alias gap="git add -p"
alias gb="git branch"
alias gba="git-branch-last-commit"
alias gco="git checkout"
alias gc^="git checkout HEAD^"
alias gco^="git checkout HEAD^"
alias gdn="git diff --name-only -- "
alias gim="git commit -m"
alias gir="git reset"
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
alias gpu="git push --set-upstream origin master"
alias gr="git reset"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias grh="git reset --hard"
alias grs="git restore --staged"
alias gic="git commit"
alias gc="git commit"
alias gica="git commit --amend"
alias gcas="git commit --amend --no-edit"
alias gcaq="git commit --amend --no-edit"
alias gicas="git commit --amend --no-edit"
alias gicaq="git commit --amend --no-edit"

alias gcla="git commit --amend --no-edit; git cl description"

function gsy {
  for i in */.git
  do ( echo $i; cd $i/..; git pull; )
  done
}

alias rebase="git rebase"
alias reb="git rebase"
alias rebi="git rebase -i"
alias rebc="git rebase --continue"
alias reba="git rebase --abort"
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

alias rgn="rg -l"

alias chops="source ~/chops_venv/bin/activate; eval \`~/chops/infra/go/env.py\`"

alias chopsupdate="gclient recurse git rebase-update"
alias gpla="gclient recurse git rebase-update"
alias chpla="gclient recurse git rebase-update"
alias updall="gclient recurse git rebase-update"

function bcm() {
  become chromeos-test@${1}.${2}
}

function bcid() {
  become chromeos-test@chromeos${1}-infra-devserver${2}.cros
}

function bcd() {
  become chromeos-test@chromeos${1}-devserver${2}.cros
}

bcf() {
  bcm cros-full-00${1} ${2-mtv}
}

bcs() {
  bcm chromeos-skunk-${1} ${2-mtv}
}

bcbh() {
  bcm cros-bighd-000${1} ${2-mtv}
}

function rebase_all() {
  cd ${1-''}
  for branch in $(git branch | cut -c 3-);
  do
    gco $branch
    rr.
  done
}
alias rra="rebase_all"

alias fin='find . \( -type d \( -path "*/chroot" -o -path "*/containers" \) \! -prune \) -o'
alias finn='fin -name '
alias fnn='fin -name '
alias fn="fin"
alias fd="fin"


alias ta="tmx2 attach -d || tmux attach -d || tm"
alias tm="tmx2 || tmux"
function mux {
  if [ ! "$TMUX" ]; then
    if [ -d ~/chromiumos ]; then
      cd ~/chromiumos
    else cd ~;
    fi
    ta
  fi
}

alias chops='source ~/chops_venv/bin/activate; eval `~/chops/infra/go/env.py`'

alias gph="git push heroku master"

alias ptex="pdflatex -interaction scrollmode"

alias v='f -e vim'
alias c='f -e cat'

pythonmakedir() {
    mkdir "$@"
    touch "$@/__init__.py"
}
alias pmd="pythonmakedir"

if [ -f ~/bin/bashrc/test_aliases ]; then
  . ~/bin/bashrc/test_aliases
fi
