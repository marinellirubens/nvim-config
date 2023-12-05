call plug#begin()
" Plugins 
Plug 'sheerun/vim-polyglot'
Plug 'pixelneo/vim-python-docstring'
" File browsing with a nice tree
Plug 'preservim/nerdtree'

" Comment on files in a easy manner
Plug 'preservim/nerdcommenter'

" STYLE kashdfkshdkfhsk
" Nicer bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'lukas-reineke/indent-blankline.nvim'

" colorscheme
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'lukas-reineke/virt-column.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'AlexvZyl/nordic.nvim'
Plug 'pappasam/papercolor-theme-slim'
Plug 'sainnhe/sonokai'

" Autocompletion / lsp configuration
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-vsnip' 
"Plug 'hrsh7th/vim-vsnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'golang/vscode-go'
Plug 'ThePrimeagen/vim-be-good'

if has('win32') < 1 
    Plug 'nvim-treesitter/nvim-treesitter'
    "Plug 'puremourning/vimspector'
endif

Plug 'tpope/vim-fugitive'

" Language specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Telescope requirements
Plug 'nvim-lua/plenary.nvim'
Plug 'wbthomason/packer.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'

" easyer motions 
"Plug 'easymotion/vim-easymotion'

" debug
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

" toggleterm
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'xiyaowong/transparent.nvim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'kdheepak/lazygit.nvim'

" plugin for a floating command line
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'
call plug#end()


if $TERM_PROGRAM != "Apple_Terminal"
    "-----------------------------------------------------
    " sets colorscheme
    "-----------------------------------------------------
    set background=dark
    "colorscheme tokyonight
    "colorscheme PaperColorSlim
    "let g:sonokai_style = 'maia'
    "let g:sonokai_style = 'andromeda'
    "let g:sonokai_style = 'shusia'
    "let g:sonokai_style = 'atlantis'
    "let g:sonokai_better_performance = 1
    "colorscheme sonokai

    "colorscheme tokyonight-night
    "colorscheme tokyonight-storm
    "colorscheme tokyonight-day
    "colorscheme nordic

    colorscheme gruvbox
    "colorscheme dracula
    "colorscheme shades_of_purple
    set termguicolors
endif

"" command to run file automatically when using :make
autocmd Filetype python setlocal makeprg=/bin/python3\ %
autocmd Filetype python setlocal expandtab
autocmd Filetype python nnoremap <leader>da <cmd>DocstringTypes<cr>
autocmd Filetype go setlocal makeprg=go\ run\ .
autocmd Filetype sh setlocal makeprg=sh\ %

syntax enable
set clipboard=unnamedplus
set hidden
set number
set relativenumber!
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set scrolloff=7
"filetype indent plugin on
"filetype indent on
"set smartindent
set autoindent

set autowrite
set splitbelow
set splitright
set listchars=tab:>\ ,trail:~,extends:>,precedes:<

set list

" node configuration for windows machine
"let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'

" nerdtree configuration
let NERDTreeQuitOnopen=1
nmap <f2> :NERDTreeRefreshRoot<CR>:NERDTreeToggle<CR>
nmap <f3> :NERDTreeRefreshRoot<CR>
"nmap <f2> :NERDTreeToggle<CR>

" easyer motion on page up and down
nnoremap <C-j> <C-d>zz
vnoremap <C-j> <C-d>zz

nnoremap <C-k> <C-u>zz
vnoremap <C-k> <C-u>zz

nnoremap <C-d> <C-d>zz
vnoremap <C-d> <C-d>zz

nnoremap <C-u> <C-u>zz
vnoremap <C-u> <C-u>zz
"nnoremap <C-n> :next<CR>
"nnoremap <C-b> :Next<CR>
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
augroup END


" Language specific
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:coc_disable_startup_warning = 1
let g:netrw_browse_split=2
" vimspector
"if has('win32') < 1 
    "let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"endif

let mapleader = " "
nnoremap <leader>ps :lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Grep for >")})<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>vs <cmd>vertical split<cr>
nnoremap <leader>hs <cmd>split<cr>
nnoremap <leader>tt <cmd>ToggleTerm<cr>
nnoremap <S-Tab> <cmd>tabnext<cr>
nnoremap <leader>mm <cmd>make<cr>
nnoremap <C-w><C-h> <cmd>vertical resize +5<cr>
nnoremap <C-w><C-l> <cmd>vertical resize -5<cr>
nnoremap <C-w><C-j> <cmd>horizontal resize +5<cr>
nnoremap <C-w><C-k> <cmd>horizontal resize -5<cr>
nnoremap <leader>r <cmd>source ~/.config/nvim/init.vim<cr>
nnoremap <leader>tp <cmd>TransparentToggle<cr>

nnoremap <silent> <leader>gg :LazyGit<CR>
nnoremap <leader>c :set colorcolumn=100<CR>
nnoremap <leader>nc :set colorcolumn-=100<CR>
" Including other configuration files in lua
lua require("rbs")
highlight Visual cterm=bold ctermbg=Red ctermfg=cyan guibg=Green

