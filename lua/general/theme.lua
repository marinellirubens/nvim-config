local theme = require('last-color').recall()
vim.cmd(('colorscheme %s'):format(theme))

--using monoakai pro the coloscheme is being set in the plugin

--light themes
--vim.cmd.colorscheme "bluloco-light"
--vim.cmd.colorscheme "dawnfox"
--vim.cmd.colorscheme "dayfox"
--vim.cmd.colorscheme "catppuccin-latte"

--dark themes
--vim.cmd.colorscheme "monokai-pro"
--vim.cmd[[colorscheme monokai-pro]]
--vim.cmd("colorscheme monokai-pro")
--vim.cmd.colorscheme "catppuccin"
--vim.cmd.colorscheme "gruvbox"
--vim.cmd.colorscheme "nightfox"
--vim.cmd.colorscheme "carbonfox"
--vim.cmd.colorscheme "nordfox"
--vim.cmd.colorscheme "PaperColorSlim"

-- coolor column configuration
vim.cmd[[highlight ColorColumn guibg=black]]

-- highlight selection configuration
vim.cmd[[highlight Visual cterm=bold ctermbg=Red ctermfg=cyan guibg=Green]]

-- highlight on yank
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
augroup END
]]
vim.cmd[[syntax enable]]

--vim.cmd.termguicolors = true
--vim.cmd.background = "dark"

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })
vim.cmd[[
augroup FixColorScheme
  autocmd!
  autocmd ColorScheme default call LastColor()
augroup END
]]
