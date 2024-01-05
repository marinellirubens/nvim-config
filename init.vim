call plug#begin()
" Plugins 
Plug 'sheerun/vim-polyglot'
Plug 'pixelneo/vim-python-docstring'
" File browsing with a nice tree
"Plug 'preservim/nerdtree'

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
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'

" plugins for note taking
Plug 'epwalsh/obsidian.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" if error on the post hook run the following command
" :call mkdp#util#install()
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'


Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/ddc.vim'
Plug 'loctvl842/monokai-pro.nvim'
call plug#end()


if $TERM_PROGRAM != "Apple_Terminal"
    "-----------------------------------------------------
    " sets colorscheme
    "-----------------------------------------------------
    set termguicolors
    set background=dark
    "colorscheme PaperColorSlim

    " sonokai configuration
    "let g:sonokai_style = 'maia'
    "let g:sonokai_style = 'default'
    "let g:sonokai_style = 'andromeda'
    "let g:sonokai_style = 'shusia'
    "let g:sonokai_style = 'atlantis'
    "let g:sonokai_better_performance = 1
    "colorscheme sonokai

    " monokai configuration
    colorscheme monokai-pro

    " tokyonight configuration
    "colorscheme tokyonight
    "colorscheme tokyonight-night
    "colorscheme tokyonight-storm
    "colorscheme tokyonight-day

    " others
    "colorscheme nordic
    "colorscheme gruvbox
    "colorscheme dracula
    "colorscheme shades_of_purple
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
"set relativenumber!
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set scrolloff=7
set autoindent
set autowrite
set splitbelow
set splitright
set listchars=tab:>\ ,trail:~,extends:>,precedes:<
set list
"filetype indent plugin on
"filetype indent on
"set smartindent

" node configuration for windows machine
"let g:coc_node_path = 'C:\Program Files\nodejs\node.exe'

" moved to keymap file
"nmap <f2> :NvimTreeOpen<CR>:NvimTreeToggle<CR>
"nmap <f3> :NvimTreeRefresh<CR>
"nmap <f2> :NvimTreeToggle<CR>

" easyer motion on page up and down
" moved to keymap file
"nnoremap <C-j> <C-d>zz
"vnoremap <C-j> <C-d>zz

"nnoremap <C-k> <C-u>zz
"vnoremap <C-k> <C-u>zz

"nnoremap <C-d> <C-d>zz
"vnoremap <C-d> <C-d>zz

"nnoremap <C-u> <C-u>zz
"vnoremap <C-u> <C-u>zz

"nnoremap <C-n> :next<CR>
"nnoremap <C-b> :Next<CR>
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
augroup END

" Including other configuration files in lua
highlight Visual cterm=bold ctermbg=Red ctermfg=cyan guibg=Green
lua require("main_cfg")
highlight ColorColumn guibg=Green
" dadbod (db) configuration
"let g:dbs = {
"\  'ilm_local': 'postgres://ILMUSER:postgres@localhost:5435/ILM'
"\ }

" For built in omnifunc
autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni

" hrsh7th/nvim-cmp
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

" Shougo/ddc.vim
call ddc#custom#patch_filetype(['sql', 'mysql', 'plsql'], 'sources', 'dadbod-completion')
call ddc#custom#patch_filetype(['sql', 'mysql', 'plsql'], 'sourceOptions', {
\ 'dadbod-completion': {
\   'mark': 'DB',
\   'isVolatile': v:true,
\ },
\ })

" Source is automatically added, you just need to include it in the chain complete list
let g:completion_chain_complete_list = {
    \   'sql': [
    \    {'complete_items': ['vim-dadbod-completion']},
    \   ],
    \ }
" Make sure `substring` is part of this list. Other items are optional for this completion source
let g:completion_matching_strategy_list = ['exact', 'substring']
" Useful if there's a lot of camel case items
let g:completion_matching_ignore_case = 1
