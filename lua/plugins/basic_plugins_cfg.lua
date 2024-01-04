-- plugins direct configuration
require("ibl").setup ()
require('telescope').setup{
    pickers = {
        find_files = {
            hidden = false
        }
    }
}
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
require("virt-column").setup()
