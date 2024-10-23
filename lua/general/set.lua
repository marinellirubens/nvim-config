function table_contains(tbl, x)
    local found = false
    for _, v in pairs(tbl) do
        if v == x then
            found = true
        end
    end
    return found
end

if not table_contains(vim.g.languages_sub, vim.bo.filetype) then
    vim.opt.laststatus = 0
end

-- search configuration
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- conceallevel for obsidian
vim.opt.conceallevel = 1

-- clipboard configuration to use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- configuration for cursor and visualisation
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4

-- configuration for indent
vim.opt.autoindent = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.list = true
vim.opt.listchars = 'tab:> ,trail:~,extends:>,precedes:<'
--if vim.fn.has('win32') < 1 then
    --vim.opt.listchars:append "space:⋅"
--end
vim.opt.syntax = 'enable'
vim.cmd[[set nocompatible]]
vim.cmd[[filetype plugin on]]
vim.cmd[[set path+=**]]

--configuration for split
vim.opt.splitbelow = true
--configuration for vertical split
vim.opt.splitright = true

-- file configuration
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.env.HOME .. "/.nvim/undodir"

vim.opt.undofile = true
vim.opt.updatetime = 50

-- configuration for terminal colors
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Language specific
vim.g.go_def_mode='gopls'
vim.g.go_info_mode='gopls'
vim.g.netrw_browse_split=2

-- plugins specific
vim.g.vim_markdown_folding_disabled = 1

--keybing to avoid error on ctrl + c on sql files
vim.g.ftplugin_sql_omni_key = nil
vim.g.omni_sql_no_default_maps = 1


-- automcmd for specific file types
vim.cmd[[autocmd Filetype python setlocal makeprg=/bin/python3\ %]]
vim.cmd[[autocmd Filetype python setlocal expandtab]]
vim.cmd[[autocmd Filetype go setlocal makeprg=go\ run\ .]]
vim.cmd[[autocmd Filetype sh setlocal makeprg=sh\ %]]

vim.cmd[[command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]]
-- Remove whitespace on save
vim.api.nvim_create_autocmd(
  'BufWritePre',
  {
    pattern = '',
    command = ":%s/\\s\\+$//e"
  }
)
-- coolor column configuration
--vim.cmd[[highlight ColorColumn guibg=black]]

---- highlight selection configuration
--vim.cmd[[highlight Visual cterm=bold ctermbg=Red ctermfg=cyan guibg=Green]]

---- highlight on yank
--vim.cmd[[
--augroup highlight_yank
    --autocmd!
    --au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
--augroup END
--]]
--vim.cmd[[syntax enable]]

--vim.g.completion_chain_complete_list = {'sql': [{'complete_items': ['vim-dadbod-completion']}] }
--Make sure `substring` is part of this list. Other items are optional for this completion source
vim.g.completion_matching_strategy_list = {'exact', 'substring'}
--" Useful if there's a lot of camel case items
vim.g.completion_matching_ignore_case = 1
vim.g.session_directory = vim.env.HOME .. '/.vim_sessions/'

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
--vim.api.nvim_create_autocmd("BufWritePre", {
  --pattern = "*.go",
  --callback = function()
   --require('go.format').gofmt()
  --end,
  --group = format_sync_grp,
--})

local function system(command)
  local file = assert(io.popen(command, 'r'))
  local output = file:read('*all'):gsub("%s+", "")
  file:close()
  return output
end

if vim.fn.executable("python3") > 0 then
  vim.env.PYENV_VERSION = vim.fn.system('pyenv version'):match('(%S+)%s+%(.-%)')
  vim.g.python3_host_prog = system("which python")
end
