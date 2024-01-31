-- setting map leader
vim.g.mapleader = ' '

--keybing to avoid error on ctrl + c on sql files
vim.g.ftplugin_sql_omni_key = nil
vim.g.omni_sql_no_default_maps = 1

-- mapping for the comments
vim.keymap.set("n", "<C-/>", "<Plug>NERDCommenterToggle", { desc = "NERDCommenterToggle" })
vim.keymap.set("v", "<C-/>", "<Plug>NERDCommenterToggle<CR>gv", { desc = "NERDCommenterToggle" })
vim.keymap.set("n", "<C-_>", "<Plug>NERDCommenterToggle", { desc = "NERDCommenterToggle" })
vim.keymap.set("v", "<C-_>", "<Plug>NERDCommenterToggle<CR>gv", { desc = "NERDCommenterToggle" })

-- remove highlight on searchs
vim.keymap.set("n", "<leader>q",":nohlsearch<Bar>:echo<CR>", { noremap = true, silent = true , desc = "Remove highlight on searchs"})

-- page up/down with centralization
--vim.keymap.set("n", "<C-j>","<C-d>zz")
--vim.keymap.set("v", "<C-j>","<C-d>zz")
--vim.keymap.set("n", "<C-k>","<C-u>zz")
--vim.keymap.set("v", "<C-k>","<C-u>zz")
vim.keymap.set("n", "<C-d>","<C-d>zz")
vim.keymap.set("v", "<C-d>","<C-d>zz")
vim.keymap.set("n", "<C-u>","<C-u>zz")
vim.keymap.set("v", "<C-u>","<C-u>zz")

-- file tree
vim.keymap.set("n", "<f2>",":NvimTreeOpen<CR>:NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Open file tree" })
vim.keymap.set("n", "<f3>",":NvimTreeRefresh<CR>", { noremap = true, silent = true, desc = "Refresh file tree" })
vim.keymap.set("n", "<f2>",":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })

-- live grep on files
vim.keymap.set("n",
    "<leader>ps", ":lua require'telescope.builtin'.grep_string({ search = vim.fn.input(\"Grep for >\")})<CR>",
    { noremap = true, silent = true , desc = "Live grep on files"})

--mapping for lazygit
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true , desc = "Lazygit"})

-- Telescope mappings
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true , desc = "Telescope Live grep on files"})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true , desc = "Telescope Find files"})
vim.keymap.set("n", "<leader>fj", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true , desc = "Telescope git files"})
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true , desc = "Telescope find in current buffer"})
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true , desc = "Telescope buffers"})
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { noremap = true, silent = true , desc = "Telescope buffers"})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true , desc = "Telescope help tags"})
vim.keymap.set("n", "<leader>nd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true , desc = "Telescope diagnostics"})

vim.keymap.set("n", "<leader>ll", "<cmd>Telescope colorscheme<CR>", { noremap = true, silent = true , desc = "Telescope diagnostics"})
-- split window
vim.keymap.set("n", "<leader>vs", "<cmd>vertical split<cr>", { noremap = true, desc = "Split window vertical"})
vim.keymap.set("n", "<leader>hs", "<cmd>split<cr>", { noremap = true, desc = "Split window horizontal"})

-- open/close embbed terminal
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { noremap = true, desc = "Open/close embbed terminal"})

-- tab movement, removed because I don't use tabs
--vim.keymap.set("n", "<S-Tab>", "<cmd>tabprevious<cr>")
--vim.keymap.set("n", "<Tab>", "<cmd>tabnext<cr>")

--execute the current file if is mapped (configuration on file lua/general/set.lua)
vim.keymap.set("n", "<leader>mm", "<cmd>make<cr>", { noremap = true, desc = "Run the current file"})

-- resize splitted window
vim.keymap.set("n", "<C-w><C-h>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<C-w><C-l>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<C-w><C-j>", "<cmd>horizontal resize +5<cr>")
vim.keymap.set("n", "<C-w><C-k>", "<cmd>horizontal resize -5<cr>")

-- reload nvim configuration
-- apply/remove transparency
vim.keymap.set("n", "<leader>tp", "<cmd>TransparentToggle<cr>")

-- colorcolumn
vim.keymap.set("n", "<leader>c", ":set colorcolumn=120<CR>", { noremap = true, silent = true , desc = "Colorcolumn"})
vim.keymap.set("n", "<leader>nc", ":set colorcolumn-=120<CR>", { noremap = true, silent = true , desc = "Colorcolumn disable"})

-- put simbol around selection
vim.keymap.set("v", "<leader>d'", "di''<ESC>hp", { desc = "put ' around selection"})
vim.keymap.set("v", '<leader>d"', 'di""<ESC>hp', { desc = 'put " around selection'})
vim.keymap.set("v", "<leader>d(", "di()<ESC>hp", { desc = "put () around selection"})
vim.keymap.set("v", "<leader>d[", "di[]<ESC>hp", { desc = "put [] around selection"})
vim.keymap.set("v", "<leader>d{", "di{}<ESC>hp", { desc = "put {} around selection"})
vim.keymap.set("v", "<leader>d`", "di``<ESC>hp", { desc = "put `` around selection"})

-- move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true , desc = "Move selection down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true , desc = "Move selection up"})

-- format file to unix
vim.keymap.set("n", "fe", "<cmd>set fileformat=unix<CR>", { noremap = true, silent = true, desc = "Set file format to unix" })

-- move selection right and left
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true , desc = "Move selection left"})
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true , desc = "Move selection right"})

-- delete complete word
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true, desc = "Delete complete word"})
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, desc = "Delete complete word"})

-- utility to use commands without ctrl
--vim.keymap.set("n", ";", ":")

-- keymap to use different clipboardksjhfskdjfh
--vidfsdfs.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy from system clipboard' })
--vim.keydfsdfap.set({ 'n', 'x' }, '<leader>pp', '"+p', { desc = 'Copy from system clipboard' })
vim.keymap.set("n", "<leader>gw",
               "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
               { noremap = true, silent = true, desc = "open git_worktrees selector" })
vim.keymap.set("n", "<leader>gW",
               "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
               { noremap = true, silent = true, desc = "create git_worktree" })


vim.keymap.set('v', '<leader>gs', ": '<,'>Gitsigns stage_hunk<cr>", { noremap = true, silent = true, desc = "stage hunk" })
vim.keymap.set('v', '<leader>gu', ": '<,'>Gitsigns undo_stage_hunk<cr>", { noremap = true, silent = true, desc = "undo stage hunk" })
vim.keymap.set('v', '<leader>ga', ": '<,'>Gitsigns reset_hunk<CR>", { noremap = true, silent = true, desc = "reset hunk" })
vim.keymap.set('n', '<leader>gc', '<cmd> Git commit<CR>', { noremap = true, silent = true, desc = "git commit" })
vim.keymap.set('n', '<leader>gb', '<cmd> Gitsigns diffthis<CR>', { noremap = true, silent = true, desc = "git diff this" })

