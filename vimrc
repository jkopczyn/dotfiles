"should be invoked from ~/.vimrc like this:
"source ~/dotfiles/vimrc
"or substitute "~' with the true path to the repo

set nocompatible    " be iMproved, required

set tabstop=4
set softtabstop=0
set shiftwidth=4    "set default indenting to 2 spaces
set noexpandtab
set autoindent
set noimdisable
set iminsert=0
set imsearch=0
set noswapfile
set relativenumber  "set relative numberlines
set number          "show the line number of the one i'm on
set textwidth=80
set scrolloff=1
"show the 80 char rule
set colorcolumn=81
"but not in ugly red
highlight ColorColumn ctermbg=DarkBlue
set laststatus=2
set ignorecase
set smartcase

"hopefully make backspace work
set backspace=indent,eol,start

" catch common save and quit mistakes
command! WQ wq                       "meant wq
command! Wq wq                       "meant wq
command! W w                         "meant w
command! Q q                         "meant q

" copy visualy selected text to clip board
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

map + <C-W>5+
map - <C-W>5-
map . <C-W>5>
map , <C-W>5<
map <C-+> <C-W>+
map <C--> <C-W>-

"toggle numbers for printing or mouse copy-paste
nmap <C-p> :set invrelativenumber invnumber<CR>
"C-p for 'print', also C-n for 'number'
nmap <C-n> :set invrelativenumber invnumber<CR>

" check for updates to .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"set the :E to have the nice file tree structure
let g:netrw_liststyle=3

"for switching to big windows and back
nmap te :tabedit %<CR>
nmap td :tabclose<CR>

cnoreabbrev vres vertical resize
