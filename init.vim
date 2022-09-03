call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'ellisonleao/gruvbox.nvim'
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

let NERDTreeQuitOnOpen=0
nmap <F2> :NERDTreeToggle<CR>

let g:coc_disable_startup_warning = 1

inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'
set background=dark " or light if you want light mode
colorscheme gruvbox

" :CocInstall coc-python coc-go coc-pairs

