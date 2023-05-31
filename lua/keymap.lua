if vim.fn.has('macunix') then
    vim.keymap.set("n", "<C-/>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-/>", "<Plug>NERDCommenterToggle<CR>gv")
else
    vim.keymap.set("n", "<C-_>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-_>", "<Plug>NERDCommenterToggle<CR>gv")
end 
