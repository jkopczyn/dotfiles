set nocompatible
" needed to load plugins right
filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" probably needs `vim +PluginInstall +qall` run in shell at least once

Plugin 'fatih/vim-go'
" needs `:GoInstallBinaries` run at least once
" periodically run `:GoUpdateBinaries`

call vundle#end()
" no longer needed once plugins are loaded
filetype plugin indent on
syntax on

source ~/dotfiles/vim-go-config.vim
