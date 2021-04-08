imap <C-s> <Esc>:w<CR>a
nmap <C-s> :w<CR>
imap <C-z> <Esc><Undo>a
nmap <C-z> <Undo>

nnoremap <silent> <C-p> :Files<CR>
" nnoremap <silent> <C-P> :Rg<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Renaming
nmap <silent> gR <Plug>(coc-rename)

" lists
nmap <silent> ga :CocAction<CR>
nmap <silent> gf <Plug>(coc-fix-current)
nmap <silent> gh :call CocActionAsync('doHover')<CR>
nmap <silent> gs :CocFzfList symbols<CR>
nmap <silent> ge :CocFzfList diagnostics<CR>

