#!/bin/bash

pathadd() {
    # echo "before: $PATH"
    # echo "  adds: $1"
    if [ -n "$1" ] && [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    # echo " after: $PATH"
    fi
}
pathprepend() {
    # echo "before: $PATH"
    # echo "  adds: $1"
    if [ -n "$1" ] && [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1${PATH:+":$PATH"}"
    # echo " after: $PATH"
    fi
}
pathaddbin() {
    if [ -n "$1" ] && [ -d "$1" ]; then
        pathadd "${1}/bin"
    fi
}
pathprependbin() {
    if [ -n "$1" ] && [ -d "$1" ]; then
        pathprepend "${1}/bin"
    fi
}
