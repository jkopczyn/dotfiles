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
alias rgu="rg --hidden"
  alias rguu="rg --hidden --noignore" # equivalent to "rg -uu"
  alias rgun="rg --hidden -l"
  alias rguun="rg -l --hidden --noignore"
alias rgn="rg -l"
function vrg {
  vim `rg -l $@`
}
alias vrgn="vrg"

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
if [ -n "$(which fdfind)" ]; then
    alias fn='fdfind'
elif [ -n "$(which fd)" ]; then
    alias fn='fd'
fi
alias fnu="fn -uu"

# ls color support, if bash_color_check says it's supported
if [ -n $COLORS_SUPPORTED ]; then
    alias ls='ls --color=always'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

alias dotfiles='vim ~/dotfiles/bash_aliases && source ~/dotfiles/bash_aliases'
  alias dotf='dotfiles'
  alias dof='dotfiles'

# function git-branch-last-commit {
#   git branch "$@" | grep --line-buffered -v '/HEAD' | while read branch; do
#     git log -n1 --format="format:%C(auto)%D%Creset - %s %Cgreen(%ar)%Creset %C(bold blue)<%an>%n" "${branch/* /}"
#   done
# }

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
alias gd="git diff"
alias gdh="git diff HEAD -- "
  alias gdh.="git diff HEAD -- ."
  alias gdh^="git diff HEAD^ --"
  alias gdh^^="git diff HEAD^^ --"
  alias gdho="git diff HEAD" # o as in options
  alias gdho^="git diff HEAD^" # o as in options
alias gdm="git diff master --"
  alias gdom="git diff origin/master --"
  alias gdmm="git diff m/master --"
alias gdhn="git diff HEAD^ --relative --name-only -- "
    alias gdhhn="git diff HEAD --relative --name-only -- "
alias gf="git fetch"
  alias gfo="git fetch origin"
alias ggg="gap; gicas; gcu"
  alias gpgg="gap; gicas; gcu"
  alias gagg="gap; gicas; gcu"
  alias gaagg="gaa; gicas; gcu"
alias gis="git status"
  alias ghosts="command gs"
  alias gs="git status"
alias gsh="git show"
alias gp="git push"
	alias gpnv="git push --no-verify"
	alias gpf="git push -f"
alias gpl="git pull"
alias ggr="gap; gicas; ru."
  alias gpgr="gap; gicas; ru."
  alias gagr="gap; gicas; ru."
  alias gaagr="gaa; gicas; ru."
alias gst="git stash"
alias gsa="git stash apply"
alias gsl="git stash list"
alias gss="git stash show -p"
alias gsd="git stash drop"
alias reom="rebi origin/master"
alias remm="rebi m/master"
alias gm="git merge"
  alias gmm="git merge master"
  alias gmom="git merge origin/master"
alias gcup="git branch -u" # set upstream
alias refl="git reflog"
alias gch="git cherry-pick"
  alias gchc="git cherry-pick --continue"
  alias gcha="git cherry-pick --abort"

alias gvl="go vet; golint"
  alias gv="go vet"

alias ggaa="./generate.sh; git add -A"
  alias gga="./generate.sh; git add -A go/; git add -A descpb.bin; gis"

#function gsp {
#  case $1 in
#    +([[:digit:]]) )
#      git stash pop "stash@{$1}"
#      ;;
#    *)
#      git stash pop $1
#      ;;
#  esac
#}
function gsp {
	git stash pop $1
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
  done < <(gdhn | grep -v ".*.\(json\\\|md\)")
  printf '%q\n' "$args";
  vim $args;
}

function vgdhh {
  args='';
  while IFS= read file; do
    args="${args} $file";
  done < <(gdhhn | grep -v ".*.\(json\|md\)")
  printf '%q\n' "$args";
  vim $args;
}

function gdn { git diff "$1" --relative --name-only; }
function  gd^ { git diff "$1"^ "${@:1}"; }
function gdn^ { git diff "$1"^ --relative --name-only "${@:1}"; }
function gd^^ { git diff "$1"^^ "${@:1}"; }
alias gap="git add -p"
  alias gao="git add -p"
alias gb="git branch -v"
  alias gb1="git branch --show-current"
  alias gbr="git branch -rv" # on remote
alias gco="git checkout"
  alias gc="git checkout"
  alias gc.="git checkout ."
  alias gcm="git -c advice.detachedHead=false checkout master"
  alias gc^="git checkout HEAD^"
  alias gco^="git checkout HEAD^"
  alias gcom="git -c advice.detachedHead=false checkout origin/master || git -c advice.detachedHead=false checkout m/master || git -c advice.detachedHead=false checkout cros/master"
  alias gcob="git checkout -b"
  alias gcb="git checkout -b"
alias gim="git commit -m"
alias gir="git reset"
alias gl="git log"
  alias glp="git log -p"
  alias gln="git log --name-only"
alias gl1="git log -1"
  alias gl2="git log -2"
  alias gl3="git log -3"
  alias gl4="git log -4"
  alias gl5="git log -5"
  alias gl6="git log -6"
  alias gl7="git log -7"
  alias gl8="git log -8"
  alias gl9="git log -9"
# glv formats a commit to make using it as a go.mod pseudoversion easier
alias glv="TZ=UTC0 git log --date=format-local:'%Y%m%d%H%M%S' --format=v0.0.0-%cd-%h\ %s --abbrev=12 -10"
alias glv1="glv -1"

function gpu {
  git push -u origin $(git symbolic-ref --short HEAD) "$@"
}
	alias gpuf="gpu --no-verify"
alias gr="git reset"
alias grh="git reset --hard"
  alias grhm="grh origin/master || grh m/master"
  alias grh^="grh HEAD^"
alias grs="git restore --staged"
  alias grs.="git restore --staged ."
alias gic="git commit -c@ --reset-author"
  alias gicf="git commit --no-verify"
alias gica="git commit --amend"
alias gicas="git commit --amend --no-edit"
alias gics="git commit --signoff"
  alias gicsa="git commit --signoff --amend"
alias grem="git remote -v"
  alias grema="git remote add"

function gsy {
  for i in */.git
  do ( echo $i; cd $i/..; git pull; )
  done
}

alias pd="pushd"
  alias pd.1="pushd .."
  alias pd.2="pushd ../.."
  alias pd.3="pushd ../../.."
  alias pd.4="pushd ../../../.."
  alias pd.5="pushd ../../../../.."
  alias pd.6="pushd ../../../../../.."
function pd-foo {
  pushd "../${@}"
}
alias pd.="pd-foo"
  alias pd..="pd-foo"
alias pd2="pushd +2"
alias pd3="pushd +3"
alias pd4="pushd +4"
alias pd5="pushd +5"
alias pd6="pushd +6"
alias pd7="pushd +7"
alias pd8="pushd +8"
alias pd9="pushd +9"

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
alias rebe="git rebase --edit-todo"
alias rebs="git rebase --signoff"
function glg { git log --all --grep="$1"; }

alias gbi="git bisect"
alias gbis="git bisect start"
alias gbio="git bisect old"
alias gbin="git bisect new"
alias gbib="git bisect bad"
alias gbig="git bisect good"
alias gbic="git bisect --continue"
alias gbir="git bisect reset"
  alias gbia="git bisect reset"
alias gbiss="git bisect --signoff"

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

alias ta="tmux attach -d || tm"
alias tm="tmux"
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

# fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias c='f -e cat'
alias v='f -e vim'
alias p='d -e pushd'
alias l='d -e "ls --color=always"'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


function vact {
  source ~/venvs/`basename ${PWD}`/bin/activate
}
function vcreate {
  virtualenv ~/venvs/`basename ${PWD}`
}

# assurance psql for t_d_s replicas
function srpsql {
    cd ~/Code/twilio_dialing_service
    vact
    python ./chalicelib/config/secrets.py staging
    source chalicelib/config/.env-staging
    source chalicelib/config/.secrets-staging
    export PGPASSWORD=$DB_PASSWORD;
    psql --host=$DB_REPLICA_HOST --port=$DB_PORT --username=$DB_USER --dbname=$DB_NAME
}
function arpsql {
    cd ~/Code/twilio_dialing_service
    vact
    python ./chalicelib/config/secrets.py prod
    source chalicelib/config/.env-prod
    source chalicelib/config/.secrets-prod
    export PGPASSWORD=$DB_PASSWORD;
    psql --host=$DB_REPLICA_HOST --port=$DB_PORT --username=$DB_USER --dbname=$DB_NAME
}

alias js='jobs'

pythonmakedir() {
    mkdir "$@"
    touch "$@/__init__.py"
}
alias pmd="pythonmakedir"

alias ks="ls"

#Luther
function init {
    KEY_NUM=`ssh-add -l | wc -l`
    TARGET_NUM=`find ~/.ssh -maxdepth 1 -name "id*" -exec stat -f "." {} \; | wc -l`
    if (( KEY_NUM*2 < TARGET_NUM)); then
        echo "run ssh-add for private keys"
        exit 1
    fi
    pinata-ssh-forward
    aws_login
}

alias dprune="docker system prune"
alias dpsn="docker ps --format 'table {{.Status}}\t{{.ID}}\t{{.Names}}'"
  alias dspn="dpsn"
  alias wdpsn="watch -n 1 \"docker ps --format 'table {{.Status}}\t{{.ID}}\t{{.Names}}'\""
  alias wdps="wdpsn"
alias dpsan="docker ps -a --format 'table {{.Status}}\t{{.ID}}\t{{.Names}}'"
  alias dspan="dpsan"
  alias wdpsan="watch -n 1 \"docker ps -a --format 'table {{.Status}}\t{{.ID}}\t{{.Names}}'\""
  alias wdpsa="wdpsan"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dpsf="docker ps --format"
alias dpsaf="docker ps --format"
alias dpsp="docker ps --format 'table {{.Status}}\t{{.Ports}}\t{{.Names}}'"
alias dpsap="docker ps -a --format 'table {{.Status}}\t{{.Ports}}\t{{.Names}}'"
alias dpsl="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Labels}}\t{{.Image}}'"
alias dpsal="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Labels}}\t{{.Image}}'"
alias dif="docker images -f=reference="
  alias di="dif"
  alias difs="docker images -f=reference='*/shiroclient:*'"
  alias dife="docker images -f=reference='*/explorer*:*' -f=reference='*explorer*:*' -f=reference='*/hyperledger-explorer*:*' -f=reference='luthersystems/*explorer*:*'"
alias din="docker inspect --format='Container:{{slice .Id 0 12}}    Image:{{slice .Image 7 19}}'"
function dockerlogstailduration {
    docker logs --follow --until=${2:-"1m"} --tail=${3:-"-1"} $1
}
alias dl="docker logs"
  alias dlt="docker logs --follow"
  alias dltu="dockerlogstailduration"
  # alias dina="docker inspect --format='Container:{{slice .Id 0 12}}    Image:{{slice .Image 7 19}}' $(docker ps -q)"
  # alias dinaa="docker inspect --format='Container:{{slice .Id 0 12}}    Image:{{slice .Image 7 19}}' $(docker ps -aq)"
function dockerattach {
    docker exec -it $1 /bin/sh
}
alias da=dockerattach
# digest docker image into comparable format
function dockerdigest {
    docker run -it $1  sh -c 'find / -type f | sort  | xargs -I{} sha512sum {}' > ${2:-"/tmp"}/dockerfiles.$1.txt
}
alias dnl="docker network ls"
alias dn="docker network ls"

if [ -f ~/bin/bashrc/test_aliases ]; then
  . ~/bin/bashrc/test_aliases
fi
