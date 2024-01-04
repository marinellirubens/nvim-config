-- import keymap file
require("general.keymap")

-- search configuration
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- file configuration
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.env.HOME .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.list = true
vim.opt.listchars:append "tab:> "
--vim.opt.listchars:append "eol:↴"
if vim.fn.has('win32') < 1 then
    vim.opt.listchars:append "space:⋅"
end

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

-- configuration imports
require("general.lsp_config")
require("general.debugging")

-- plugins specifics imports
require("plugins.basic_plugins_cfg")
require("plugins.obsidian_cfg")
require("plugins.nvim_tree")
require("plugins.nvim-dev-icons_cfg")
require("plugins.noice_cfg")
require("plugins.monokai_pro")

