#!/bin/bash

pathadd() {
    if [ -n "$1" ] && [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="${PATH:+"$PATH:"}$1"
    fi
}
pathprepend() {
    if [ -n "$1" ] && [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1${PATH:+":$PATH"}"
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


