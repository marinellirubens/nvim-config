
vim.g.mapleader = ' '
if vim.fn.has("mac") > 0 then
    vim.keymap.set("n", "<C-/>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-/>", "<Plug>NERDCommenterToggle<CR>gv")
else
    vim.keymap.set("n", "<C-_>", "<Plug>NERDCommenterToggle")
    vim.keymap.set("v", "<C-_>", "<Plug>NERDCommenterToggle<CR>gv")
end
vim.keymap.set("n", "<leader>q",":nohlsearch<Bar>:echo<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>","<C-d>zz")
vim.keymap.set("v", "<C-j>","<C-d>zz")
vim.keymap.set("n", "<C-k>","<C-u>zz")
vim.keymap.set("v", "<C-k>","<C-u>zz")
vim.keymap.set("n", "<C-d>","<C-d>zz")
vim.keymap.set("v", "<C-d>","<C-d>zz")
vim.keymap.set("n", "<C-u>","<C-u>zz")
vim.keymap.set("v", "<C-u>","<C-u>zz")

vim.keymap.set("n", "<f2>",":NvimTreeOpen<CR>:NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<f3>",":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<f2>",":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ps", ":lua require'telescope.builtin'.grep_string({ search = vim.fn.input(\"Grep for >\")})<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>")
vim.keymap.set("n", "<leader>vs", "<cmd>vertical split<cr>")
vim.keymap.set("n", "<leader>hs", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<leader>mm", "<cmd>make<cr>")
vim.keymap.set("n", "<C-w><C-h>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<C-w><C-l>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<C-w><C-j>", "<cmd>horizontal resize +5<cr>")
vim.keymap.set("n", "<C-w><C-k>", "<cmd>horizontal resize -5<cr>")
vim.keymap.set("n", "<leader>r", "<cmd>source ~/.config/nvim/init.vim<cr>")
vim.keymap.set("n", "<leader>tp", "<cmd>TransparentToggle<cr>")

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>c", ":set colorcolumn=100<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nc", ":set colorcolumn-=100<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "<leader>d'", "di''<ESC>hp")
vim.keymap.set("v", '<leader>d"', 'di""<ESC>hp')
vim.keymap.set("v", "<leader>d(", "di()<ESC>hp")
vim.keymap.set("v", "<leader>d[", "di[]<ESC>hp")
vim.keymap.set("v", "<leader>d{", "di{}<ESC>hp")
vim.keymap.set("v", "<leader>d`", "di``<ESC>hp")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

vim.keymap.set("i", "<C-H>", "<C-W>")
vim.keymap.set("n", "<leader>nd", ":Telescope diagnostics<CR>", { noremap = true, silent = true })

--implement this later
--https://www.reddit.com/r/neovim/comments/mvhfw7/comment/gvd8rb9/?utm_source=share&utm_medium=web2x&context=3
--vim.keymap.set("n", "<leader>da", ":DocstringTypes<cr>")

--keybing to avoid error on ctrl + c on sql files
vim.g.ftplugin_sql_omni_key = nil
vim.g.omni_sql_no_default_maps = 1
