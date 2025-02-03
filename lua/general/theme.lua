local haslfs, theme = pcall(require, "last-color")
if haslfs then
    theme = theme.recall()
    vim.cmd(('colorscheme %s'):format(theme))
    vim.g.last_color = theme

    vim.cmd[[
    augroup FixColorScheme
      autocmd!
      autocmd ColorScheme default call LastColor()
    augroup END
    ]]
end

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
vim.api.nvim_set_hl(0, "Cursor", { fg = "black", bg = "yellow" })
--vim.api.nvim_set_hl(0, "CursorLine", { bg = "black" })

-- coolor column configuration
--vim.api.nvim_set_hl(0, "ColorColumn", { bg = "black" })

-- highlight selection configuration
vim.cmd[[highlight Visual cterm=bold ctermbg=Red ctermfg=cyan guibg=#39fb16 guifg=black]]
--vim.cmd.termguicolors = true
vim.cmd.background = "dark"

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "black", bg="#f2fa16" })


--add          = { hl = 'GitSignsAdd'   , text = '┃', numhl = 'GitSignsAddNr'   , linehl = 'GitSignsAddLn' },
--change       = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
--delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
--topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
--changedelete = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },

-- theme for gitsigns
vim.api.nvim_set_hl(0, "GitSignsStagedAdd", { fg = "#ffffff", bg = "#565555"})
vim.api.nvim_set_hl(0, "GitSignsStagedAddNr", { fg = "#ffffff", bg = "#565555"})

vim.api.nvim_set_hl(0, "GitSignsStagedChange", { fg = "#ffffff", bg = "#556555"})
vim.api.nvim_set_hl(0, "GitSignsStagedChangeNr", { fg = "#ffffff", bg = "#556555"})

vim.api.nvim_set_hl(0, "GitSignsStagedDelete", { fg = "#ffffff", bg = "#453130"})
vim.api.nvim_set_hl(0, "GitSignsStagedDeleteNr", { fg = "#ffffff", bg = "#453130"})
