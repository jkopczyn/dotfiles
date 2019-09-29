#!/bin/bash

function cpl {
  cp "$1" lib
}

function cda {
  builtin cd "$@" && fasd -A .;
}
alias cd="cda"

function rgmsg {
  rg "message $@"
}
alias rgn="rg -l"

function fAA {
  for d in $(find . -type d -print); do
    fasd -A $d/*
  done
}

function faa {
  find . -type d -print0 | xargs -0 fasd -A;
}

function fdd {
  find . -type d -print0 | xargs -0 fasd -D;
}

# find name
alias fn='fdfind'

function setallupstreams {
  for branch in $(git for-each-ref --format='%(refname:lstrip=2)' refs/heads/); do
    git checkout $branch
    UP=$(git cl upstream)
    if [ "$UP" = "refs/remotes/origin/master" ]; then
      git cl upstream origin/master
    fi
  done
}

alias dotfiles='vim ~/dotfiles/bash_aliases && source ~/dotfiles/bash_aliases'
  alias dotf='dotfiles'
  alias dof='dotfiles'

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

alias g="git"
alias ga="git add"
alias ga.="git add ."
alias gaa="git add -A"
  alias gaac="git add -A; git commit"
  alias gago="git add -A descpb.bin go/; gis"
alias gbd="git branch -d"
  alias gbD="git branch -D"
alias gca="git cl archive"
alias gcu="git cl upload"
alias gcup="git cl upstream"
  # p as in parent
  alias gcp="git cl upstream"
  alias gcupom="git cl upstream origin/master; gb"
  alias gcupmm="git cl upstream cros/master; gb"
  alias gcpom="git cl upstream origin/master; gb"
  alias gcpmm="git cl upstream cros/master; gb"
  alias gcupma="setallupstreams"
alias gcm="git cl description"
  alias gcd="git cl description"
alias gd="git diff"
alias gdh="git diff HEAD -- "
  alias gdh^="git diff HEAD^ --"
  alias gdh^^="git diff HEAD^^ --"
  alias gdho="git diff HEAD" # o as in options
alias gdm="git diff master --"
  alias gdom="git diff origin/master --"
  alias gdmm="git diff m/master --"
alias gdhn="git diff HEAD^ --relative --name-only -- "
alias gf="git fetch"
alias ggg="gap; gicas; gcu"
  alias gpgg="gap; gicas; gcu"
  alias gagg="gap; gicas; gcu"
  alias gaagg="gaa; gicas; gcu"
alias gis="git status"
  alias ghosts="command gs"
  alias gs="git status"
alias gsh="git show"
alias gp="git push"
alias gpl="git pull"
alias ggr="gap; gicas; ru."
  alias gpgr="gap; gicas; ru."
  alias gagr="gap; gicas; ru."
  alias gaagr="gaa; gicas; ru."
alias gst="git stash"
alias gsa="git stash apply"
alias gsl="git stash list"
alias gss="git stash show"
alias gct="git cl presubmit"
  alias gcta="git cl presubmit --all --parallel"
alias reom="rebi origin/master"
alias remm="rebi m/master"

alias gvl="go vet; golint"
  alias gv="go vet"

alias ggaa="./generate.sh; git add -A"
  alias gga="./generate.sh; git add -A go/; git add -A descpb.bin; gis"

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

function vgh {
  args='';
  while IFS= read -r -d '' file; do
    args="${args} $file";
  done < <(git diff HEAD --relative --name-only -z -- $@)
  printf '%q\n' "$args";
  vim $args;
}

function vgdh {
  args='';
  while IFS= read file; do
    args="${args} $file";
  done < <(git diff HEAD^ --relative --name-only -- | grep -v ".*.\(json\|md\)")
  printf '%q\n' "$args";
  vim $args;
}

function gd^ { git diff "$1"^ "$@"; }
function gd^^ { git diff "$1"^^ "$@"; }
alias gap="git add -p"
  alias gao="git add -p"
alias gb="git branch -v"
alias gco="git checkout"
  alias gc="git checkout"
  alias gc.="git checkout ."
  alias gc^="git checkout HEAD^"
  alias gco^="git checkout HEAD^"
  alias gcom="git -c advice.detachedHead=false checkout origin/master || git -c advice.detachedHead=false checkout m/master || git -c advice.detachedHead=false checkout cros/master"
  alias gcob="git checkout -b"
  alias gcb="git checkout -b"
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
alias grh="git reset --hard"
  alias grhm="grh origin/master || grh m/master"
  alias grh^="grh HEAD^"
alias grs="git restore --staged"
alias gic="git commit -c@ --reset-author"
alias gica="git commit --amend"
alias gicas="git commit --amend --no-edit"

alias gcla="git commit --amend --no-edit; git cl description"

function gsy {
  for i in */.git
  do ( echo $i; cd $i/..; git pull; )
  done
}

alias pd="pushd"
  alias pd.="pushd .."
  alias pd..="pushd .."
  alias pd.1="pushd .."
  alias pd.2="pushd ../.."
  alias pd.3="pushd ../../.."
  alias pd.4="pushd ../../../.."
  alias pd.5="pushd ../../../../.."
  alias pd.6="pushd ../../../../../.."

alias cd.="cd .."
  alias cd..="cd .."
  alias cd.1="cd .."
  alias cd.2="cd ../.."
  alias cd.3="cd ../../.."
  alias cd.4="cd ../../../.."
  alias cd.5="cd ../../../../.."
  alias cd.6="cd ../../../../../.."

alias rebase="git rebase"
alias reb="git rebase"
alias rebi="git rebase -i"
alias rebc="git rebase --continue"
alias reba="git rebase --abort"
function glg { git log --all --grep="$1"; }

alias ru="repo upload"
alias ru.="repo upload ."
  alias ru.nov="repo upload . --no-verify"
alias rr="repo rebase ."
alias rr.="repo rebase ."
alias rs="repo sync"
alias rs.="repo sync ."
alias rsu="repo sync; repo rebase; repo upload ."
alias rsu.="repo sync .; repo rebase .; repo upload ."
function rco() { { repo checkout "$@" 2> /dev/null || repo start "$@"; } && echo "on branch $1";}
  alias rc="rco"
  alias rcb="rco"
alias rb="repo branch . || repo branch"
alias rba="repo branch"
alias rst="repo start"
alias ra="repo abandon"
alias rp="repo prune"

alias rgn="rg -l"

alias chops='source ~/chops_venv/bin/activate; eval `~/chops/infra/go/env.py`; cd ~/chops'

alias chopsupdate="gclient recurse git rebase-update"
alias gpla="gclient recurse git rebase-update"
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

function git_rebase_all() {
  cd ${1-''}
  for branch in $(git branch | cut -c 3-);
  do
    gc $branch
    git rev-parse --verify -q @{u} &> /dev/null
    if [ $? -eq 0 ]
    then
      git rebase
    else
      git rebase origin/master
    fi
  done
}
alias gra="git_rebase_all"

function repo_rebase_all() {
  cd ${1-''}
  for branch in $(git branch | cut -c 3-);
  do
    gco $branch
    rr.
  done
}
alias rra="repo_rebase_all"

alias ta="tmx2 attach -d || tm"
alias tm="tmx2"
function mux {
  if [ ! "$TMUX" ]; then
    ta
  fi
}

function rtr {
  ./recipes.py $@ test run
}
function rtt {
  ./recipes.py $@ test train
}
alias addtrained="git add *.json *.md"
function rtta {
  ./recipes.py $@ test train; addtrained
}
function rtto {
  ./recipes.py -O $@ test train
}
function rttoa {
  ./recipes.py -O $@ test train; addtrained
}

alias gph="git push heroku master"

alias ptex="pdflatex -interaction scrollmode"

# macro for quick git initialization
alias gitmakeremote="bash $HOME/dotfiles/gitmakeremote.sh"

function vl {
  if [[ $# -ne 2 ]]; then
    echo "wrong # of args"
    return 1
  fi
  case $1 in
    ''|*[!0-9]*) num=$2; file=$1 ;;
    *) num=$1; file=$2 ;;
  esac
  case $num in
    ''|*[!0-9]*) echo "need a #"; return 1 ;;
    *) true ;;
  esac
  vim +$num $file -c 'normal zt'
}
alias vl=vl

alias c='f -e cat'
alias v='f -e vim'
alias p='d -e pushd'
alias l='d -e "ls --color=always"'

pythonmakedir() {
    mkdir "$@"
    touch "$@/__init__.py"
}
alias pmd="pythonmakedir"

alias ks="ls"

if [ -f ~/bin/bashrc/test_aliases ]; then
  . ~/bin/bashrc/test_aliases
fi
