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
--vim.opt.listchars:append "eol:↴"
require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
}

require("mason").setup()
require("lsp_config")
require("keymap")

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

