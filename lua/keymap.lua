if vim.fn.has("mac") > 0 then
    vim.keymap.set("n", "<C-/>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-/>", "<Plug>NERDCommenterToggle<CR>gv")
else
    vim.keymap.set("n", "<C-_>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-_>", "<Plug>NERDCommenterToggle<CR>gv")
end
vim.keymap.set("n", "<leader>q",":nohlsearch<Bar>:echo<CR>")

vim.keymap.set("v", "<leader>d'", "di''<ESC>hp")
vim.keymap.set("v", '<leader>d"', 'di""<ESC>hp')
vim.keymap.set("v", "<leader>d(", "di()<ESC>hp")
vim.keymap.set("v", "<leader>d[", "di[]<ESC>hp")
vim.keymap.set("v", "<leader>d{", "di{}<ESC>hp")
vim.keymap.set("v", "<leader>d`", "di``<ESC>hp")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-H>", "<C-W>")
vim.keymap.set("n", "<leader>nd", ":Telescope diagnostics<CR>")

--remap for floating command line
local fine = require('fine-cmdline')
if fine then
    vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
end
--implement this later
--https://www.reddit.com/r/neovim/comments/mvhfw7/comment/gvd8rb9/?utm_source=share&utm_medium=web2x&context=3
--vim.keymap.set("n", "<leader>da", ":DocstringTypes<cr>")
