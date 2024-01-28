local theme = require('last-color').recall()
if theme ~= nil then
    vim.cmd(('colorscheme %s'):format(theme))
end
vim.cmd[[
augroup FixColorScheme
  autocmd!
  autocmd ColorScheme default call LastColor()
augroup END
]]

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

-- highlight on yank
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
augroup END
]]
vim.cmd[[syntax enable]]

-- set color for cursor and cursorline
vim.opt.cursorline = true
vim.cmd[[highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold]]
vim.cmd[[highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=NONE guibg=black guifg=NONE]]

-- coolor column configuration
vim.cmd[[highlight ColorColumn guibg=black]]

-- highlight selection configuration
vim.cmd[[highlight Visual cterm=bold ctermbg=Red ctermfg=cyan guibg=#39fb16 guifg=black]]
--vim.cmd.termguicolors = true
--vim.cmd.background = "dark"

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "#b3ecff", bg="#f2fa16" })
