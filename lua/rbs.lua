require("keymap")
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.env.HOME .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.list = true
vim.opt.listchars:append "tab:> "

if vim.fn.has('win32') < 1 then
    vim.opt.listchars:append "space:⋅"
end


vim.g.db_ui_save_location=vim.env.HOME .. '/.vim/dadbod-ui'

--vim.opt.listchars:append "eol:↴"
require("lsp_config")
require("obsidian_cfg")
require("debugging")
require("nvim_tree")
require("nvim-dev-icons_cfg")
--require("neorg_cfg")

require("ibl").setup ()
require('telescope').setup{
    pickers = {
        find_files = {
            hidden = false
        }
    }
}
-- toggleterm configuration
require("toggleterm").setup()

require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
require('gitsigns').setup()
require('telescope').load_extension('lazygit')
--require('debug')
require("virt-column").setup()
require("noice_cfg")
