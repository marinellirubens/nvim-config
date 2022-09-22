call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set hidden
set number
set relativenumber
set mouse=a
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=indent,eol,start
set scrolloff=7

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

nnoremap <C-n> :next<CR>
nnoremap <C-b> :Next<CR>

let NERDTreeQuitOnOpen=0
nmap <F2> :NERDTreeToggle<CR>

let g:coc_disable_startup_warning = 1

inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let g:netrw_browse_split=2

