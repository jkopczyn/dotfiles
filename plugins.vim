set nocompatible
" needed to load plugins right
filetype off
filetype plugin indent off

" bootstrap Vundle if it isn't installed yet
let s:vundle_path = expand('~/.vim/bundle/Vundle.vim')
let s:vundle_freshly_installed = 0
if !filereadable(s:vundle_path . '/README.md')
    echo "Installing Vundle..."
    silent call mkdir(expand('~/.vim/bundle'), 'p')
    silent execute '!git clone https://github.com/VundleVim/Vundle.vim ' . shellescape(s:vundle_path)
    let s:vundle_freshly_installed = 1
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" plugins are auto-installed on first launch (see PluginInstall below);
" run `:PluginInstall` manually after adding new plugins here

" Plugin 'fatih/vim-go'
" needs `:GoInstallBinaries` run at least once
" periodically run `:GoUpdateBinaries` " last 2022-09-28

"plugin I'm more likely to use; github.com/<name>
Plugin 'frazrepo/vim-rainbow'

"try AI in vim
Plugin 'dense-analysis/neural'

call vundle#end()
" no longer needed once plugins are loaded
filetype plugin indent on
syntax on

" on a fresh Vundle clone, fetch the plugins declared above
if s:vundle_freshly_installed
    echo "Installing plugins..."
    PluginInstall
endif

source ~/dotfiles/neural-config.vim

source ~/dotfiles/vim-go-config.vim
