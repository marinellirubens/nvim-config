-- setting map leader
vim.g.mapleader = ' '

--vim.keymap.set("n", "<leader>r", "<cmd>echomsg lsjdflsjdf<cr>source ~/.config/nvim/init.vim<cr>")

vim.keymap.set("n", "<leader>r", function()
    print("Reloaded vim main file")
    vim.api.nvim_command("source ~/.config/nvim/init.vim")
end)
--keybing to avoid error on ctrl + c on sql files
vim.g.ftplugin_sql_omni_key = nil
vim.g.omni_sql_no_default_maps = 1

-- mapping for the comments
vim.keymap.set("n", "<C-/>", "<Plug>NERDCommenterToggle")
vim.keymap.set("v", "<C-/>", "<Plug>NERDCommenterToggle<CR>gv")
vim.keymap.set("n", "<C-_>", "<Plug>NERDCommenterToggle")
vim.keymap.set("v", "<C-_>", "<Plug>NERDCommenterToggle<CR>gv")

-- remove highlight on searchs
vim.keymap.set("n", "<leader>q",":nohlsearch<Bar>:echo<CR>", { noremap = true, silent = true })

-- page up/down with centralization
vim.keymap.set("n", "<C-j>","<C-d>zz")
vim.keymap.set("v", "<C-j>","<C-d>zz")
vim.keymap.set("n", "<C-k>","<C-u>zz")
vim.keymap.set("v", "<C-k>","<C-u>zz")
vim.keymap.set("n", "<C-d>","<C-d>zz")
vim.keymap.set("v", "<C-d>","<C-d>zz")
vim.keymap.set("n", "<C-u>","<C-u>zz")
vim.keymap.set("v", "<C-u>","<C-u>zz")

-- file tree
vim.keymap.set("n", "<f2>",":NvimTreeOpen<CR>:NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<f3>",":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<f2>",":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- live grep on files
vim.keymap.set("n",
    "<leader>ps", ":lua require'telescope.builtin'.grep_string({ search = vim.fn.input(\"Grep for >\")})<CR>",
    { noremap = true, silent = true })

-- Telescope mappings
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>")
vim.keymap.set("n", "<leader>nd", ":Telescope diagnostics<CR>", { noremap = true, silent = true })

-- split window
vim.keymap.set("n", "<leader>vs", "<cmd>vertical split<cr>")
vim.keymap.set("n", "<leader>hs", "<cmd>split<cr>")

-- open/close embbed terminal
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>")

-- tab movement
vim.keymap.set("n", "<S-Tab>", "<cmd>tabprevious<cr>")
--vim.keymap.set("n", "<Tab>", "<cmd>tabnext<cr>")

-- run the current file if is mapped 
vim.keymap.set("n", "<leader>mm", "<cmd>make<cr>")

-- resize splitted window
vim.keymap.set("n", "<C-w><C-h>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<C-w><C-l>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<C-w><C-j>", "<cmd>horizontal resize +5<cr>")
vim.keymap.set("n", "<C-w><C-k>", "<cmd>horizontal resize -5<cr>")

-- reload nvim configuration
-- apply/remove transparency
vim.keymap.set("n", "<leader>tp", "<cmd>TransparentToggle<cr>")

-- lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })

-- colorcolumn
vim.keymap.set("n", "<leader>c", ":set colorcolumn=100<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>nc", ":set colorcolumn-=100<CR>", { noremap = true, silent = true })

-- put simbol around selection
vim.keymap.set("v", "<leader>d'", "di''<ESC>hp")
vim.keymap.set("v", '<leader>d"', 'di""<ESC>hp')
vim.keymap.set("v", "<leader>d(", "di()<ESC>hp")
vim.keymap.set("v", "<leader>d[", "di[]<ESC>hp")
vim.keymap.set("v", "<leader>d{", "di{}<ESC>hp")
vim.keymap.set("v", "<leader>d`", "di``<ESC>hp")

-- move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- move selection right and left
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- delete complete work
vim.keymap.set("i", "<C-H>", "<C-W>")
vim.keymap.set("i", "<C-BS>", "<C-W>")

-- strange mapping to get out of insert mode without moving from home row
--vim.keymap.set("i", "fj", "<ESC>")
--vim.keymap.set("i", "jf", "<ESC>")

-- utility to use commands without ctrl
vim.keymap.set("n", ";", ":")

