
" Show the function signature for a given routine with \ + i:
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)

" Show the interfaces a type implements with \ + ii:
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)

" Describe the definition of a given type with \ + ci:
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)

" See the callers of a given function with \ + cc:
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)

" Rename the symbol your cursor is on with \ + r:
nmap <leader>r <Plug>(go-rename)

" Find all references of a given type/function in the codebase with \ + cr:
"  " doesn't have equivalent in vim-go, I think
" nmap <leader>cr <Plug>(coc-references)

" Go to definition/Go back with Ctrl+d and Ctrl+a:
"  " C-a taken, consider alternatives
" nmap <C-a> <C-o>
" nmap <C-d> <Plug>(coc-definition)
