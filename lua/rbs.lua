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
