-- search configuration
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- conceallevel for obsidian
vim.opt.conceallevel = 1
vim.opt.clipboard = 'unnamedplus'

vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.scrolloff = 7
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.listchars = 'tab:> ,trail:~,extends:>,precedes:<'
if vim.fn.has('win32') < 1 then
    vim.opt.listchars:append "space:⋅"
end

-- file configuration
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.env.HOME .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.list = true

-- configuration for terminal colors
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Language specific
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'
vim.g.netrw_browse_split=2

-- plugins specific
vim.g.coc_disable_startup_warning = 1
vim.g.vim_markdown_folding_disabled = 1

--keybing to avoid error on ctrl + c on sql files
vim.g.ftplugin_sql_omni_key = nil
vim.g.omni_sql_no_default_maps = 1

-- dadbod ui saving location
vim.g.db_ui_save_location=vim.env.HOME .. '/.vim/dadbod-ui'
print(vim.g.db_ui_save_location)

vim.cmd[[autocmd Filetype python setlocal makeprg=/bin/python3\ %]]
vim.cmd[[autocmd Filetype python setlocal expandtab]]
vim.cmd[[autocmd Filetype python nnoremap <leader>da <cmd>DocstringTypes<cr>]]
vim.cmd[[autocmd Filetype go setlocal makeprg=go\ run\ .]]
vim.cmd[[autocmd Filetype sh setlocal makeprg=sh\ %]]
vim.cmd[[autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni]]

--hrsh7th/nvim-cmp
vim.cmd[[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]
vim.cmd[[highlight ColorColumn guibg=Green]]
vim.cmd[[highlight Visual cterm=bold ctermbg=Red ctermfg=cyan guibg=Green]]
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
augroup END
]]
vim.cmd[[syntax enable]]

--vim.g.completion_chain_complete_list = {'sql': [{'complete_items': ['vim-dadbod-completion']}] }
--Make sure `substring` is part of this list. Other items are optional for this completion source
vim.g.completion_matching_strategy_list = {'exact', 'substring'}
--" Useful if there's a lot of camel case items
vim.g.completion_matching_ignore_case = 1

