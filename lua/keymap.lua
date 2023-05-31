if vim.fn.has('macunix') then
    vim.keymap.set("n", "<C-/>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-/>", "<Plug>NERDCommenterToggle<CR>gv")

    vim.keymap.set("v", "<leader>dd", "di''<ESC>hp")
else
    vim.keymap.set("n", "<C-_>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-_>", "<Plug>NERDCommenterToggle<CR>gv")
end

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

