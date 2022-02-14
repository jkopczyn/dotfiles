set nocompatible
" needed to load plugins right
filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'

" no longer needed once plugins are loaded
filetype plugin indent on
syntax on
