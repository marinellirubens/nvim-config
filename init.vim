" Including other configuration files in lua
lua require("rbs")

" command to run file automatically when using :make
autocmd Filetype python setlocal makeprg=/bin/python3\ %
autocmd Filetype go setlocal makeprg=go\ run\ .
autocmd Filetype sh setlocal makeprg=sh\ %

" Plugins 
call plug#begin()
Plug 'sheerun/vim-polyglot'

" File browsing with a nice tree
Plug 'preservim/nerdtree'

" Comment on files in a easy manner
Plug 'preservim/nerdcommenter'

" STYLE
" Nicer bar at the bottom
Plug 'vim-airline/vim-airline'

" colorscheme
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim'

" Autocompletion 
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Language specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Telescope requirements
Plug 'nvim-lua/plenary.nvim'
Plug 'wbthomason/packer.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'

" easyer motions 
Plug 'easymotion/vim-easymotion'

" debug
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'puremourning/vimspector'

" toggleterm
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

"-----------------------------------------------------
" sets colorscheme
"-----------------------------------------------------
set background=dark " or light if you want light mode
colorscheme gruvbox


"colorscheme tokyonight
" There are also colorschemes for the different styles
"colorscheme tokyonight-night
"colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon

"-----------------------------------------------------
syntax enable
set hidden
set number
set relativenumber
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set backspace=indent,eol,start
set scrolloff=7

set smartindent

set splitbelow
set splitright
set list

" node configuration for windows machine
"let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'

" nerdtree configuration
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
let NERDTreeQuitOnopen=1
nmap <f2> :NERDTreeToggle<CR>

" easyer motion on page up and down
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
"nnoremap <C-n> :next<CR>
"nnoremap <C-b> :Next<CR>

" toggleterm configuration
lua require("toggleterm").setup()

" ==============================================================================
" Coc configuration
" ==============================================================================
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

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" ==============================================================================

" Language specific
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:coc_disable_startup_warning = 1
let g:netrw_browse_split=2

" :CocInstall coc-python coc-go coc-pairs

let mapleader = " "
nnoremap <leader>ps :lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Grep for >")})<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>vs <cmd>vertical split<cr>
nnoremap <leader>tt <cmd>ToggleTerm<cr>
nnoremap <S-Tab> <cmd>tabnext<cr>
nnoremap <leader>mm <cmd>make<cr>


" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'


if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif


