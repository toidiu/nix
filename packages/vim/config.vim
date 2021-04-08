set expandtab
set hidden
set mouse=a
set title
set number
set signcolumn=yes
set clipboard=unnamed

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = '~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rustfmt'

" wrap cursor at beginning/end
set whichwrap+=<,>,h,l,[,]

" Set working directory
let g:rooter_patterns = ['.git', 'rust-toolchain', 'configuration.nix']
let g:rooter_silent_chdir = 1

" Whitespace fixes
autocmd FileType c,css,html,json,markdown,nix,yaml,yml,vim EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0

" Airline
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1

" Searching
set incsearch
set hlsearch

" persistent undo
try
    set undodir=~/.local/share/nvim/undodir
    set undofile
catch
endtry

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
