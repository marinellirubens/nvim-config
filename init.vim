call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'ellisonleao/gruvbox.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" obrigatorio pra o telecope funcionar
Plug 'nvim-lua/plenary.nvim'
Plug 'wbthomason/packer.nvim'

" obrigatorio pro live_grep e grepstring funcionar
"Plug 'BurntSushi/ripgrep'
"Plug 'sharkdp/fd'
" tive que instalar usando o homebrew
" brew install fd
" brew install ripgre
Plug 'easymotion/vim-easymotion'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

" O telescope em si (excencial)
Plug 'nvim-telescope/telescope.nvim'

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

set splitbelow
set splitright
set list
lua require("toggleterm").setup()


"let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

nnoremap <C-n> :next<CR>
nnoremap <C-b> :Next<CR>

let NERDTreeQuitOnOpen=0
nmap <F2> :NERDTreeToggle<CR>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:coc_disable_startup_warning = 1

let g:netrw_browse_split=2

" set background=dark " or light if you want light mode
" colorscheme gruvbox

" :CocInstall coc-python coc-go coc-pairs
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let mapleader = " "
nnoremap <leader>ps :lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Grep for >")})<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>t <cmd>ToggleTerm<cr>
nnoremap <leader>vs <cmd>vertical split<cr>

nnoremap <leader>nn :next<CR>
nnoremap <leader>NN :Next<CR>

if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif
