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
vim.keymap.set("n", "<leader>q", ":nohlsearch<Bar>:echo<CR>", { noremap = true, silent = true , desc = "Remove highlight on searchs"})

-- page up/down with centralization
vim.keymap.set("n", "<C-d>","<C-d>zz")
vim.keymap.set("v", "<C-d>","<C-d>zz")
vim.keymap.set("n", "<C-u>","<C-u>zz")
vim.keymap.set("v", "<C-u>","<C-u>zz")

vim.keymap.set("n", "ZA",":qall!<CR>", { noremap = true, silent = true , desc = "Exit all without saving"})
--vim.keymap.set("n", "<C-h>","<C-w>h")
--vim.keymap.set("n", "<C-j>","<C-w>j")
--vim.keymap.set("n", "<C-k>","<C-w>k")
--vim.keymap.set("n", "<C-l>","<C-w>l")

-- file tree
vim.keymap.set("n", "<f2>",":NvimTreeOpen<CR>:NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Open file tree" })
vim.keymap.set("n", "<f3>",":NvimTreeRefresh<CR>", { noremap = true, silent = true, desc = "Refresh file tree" })
vim.keymap.set("n", "<f2>",":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })

-- live grep on files
vim.keymap.set("n",
    "<leader>gi", ":lua require'telescope.builtin'.grep_string({ search = vim.fn.input(\"Grep for >\")})<CR>",
    { noremap = true, silent = true , desc = "grep on files (input)"})

--mapping for lazygit
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true , desc = "Lazygit"})

-- Telescope mappings
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true , desc = "Telescope Live grep on files"})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true , desc = "Telescope Find files"})
vim.keymap.set("n", "<leader>fj", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true , desc = "Telescope git files"})
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = true , desc = "Telescope find in current buffer"})
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true , desc = "Telescope buffers"})
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { noremap = true, silent = true , desc = "Telescope keymaps"})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true , desc = "Telescope help tags"})
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { noremap = true, silent = true , desc = "Telescope help tags"})

--vim.keymap.set("n", "<leader>fe", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true , desc = "Telescope diagnostics"})
vim.keymap.set("n", "<leader>fe", ":lua require('telescope.builtin').diagnostics({layout_strategy='vertical'})<CR>", { noremap = true, silent = true , desc = "Telescope diagnostics"})

vim.keymap.set("n", "<leader>ll", "<cmd>Telescope colorscheme<CR>", { noremap = true, silent = true , desc = "Telescope colorscheme"})

vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { noremap = true, silent = true , desc = "Todo Trouble" })
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { noremap = true, silent = true , desc = "Todo Telescope" })
-- split window
vim.keymap.set("n", "<leader>sv", "<cmd>vertical split<cr>", { noremap = true, desc = "Split window vertical"})
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", { noremap = true, desc = "Split window horizontal"})

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

function ToggleColorColumn()
    --print(dump(vim.opt.colorcolumn["_value"]))
    print(vim.opt.colorcolumn["_value"])
    if vim.opt.colorcolumn["_value"] == "120" then
        vim.cmd[[set colorcolumn-=120]]
    else
        vim.cmd[[set colorcolumn=120]]
    end
end

-- colorcolumn
vim.keymap.set("n", "<leader>nc", ToggleColorColumn, { noremap = true, silent = true , desc = "Colorcolumn"})

-- put simbol around selection
vim.keymap.set("v", "'", "c''<ESC>P", { desc = "put ' around selection"})
vim.keymap.set("v", '"', 'c""<ESC>P', { desc = 'put " around selection'})
vim.keymap.set("v", "(", "c()<ESC>P", { desc = "put () around selection"})
vim.keymap.set("v", "[", "c[]<ESC>P", { desc = "put [] around selection"})
vim.keymap.set("v", "{", "c{}<ESC>P", { desc = "put {} around selection"})
vim.keymap.set("v", "`", "c``<ESC>P", { desc = "put `` around selection"})

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
vim.keymap.set("i", "<M-BS>", "<C-W>", { noremap = true, desc = "Delete complete word"})

-- utility to use commands without ctrl
--vim.keymap.set("n", ";", ":")

-- keymap to use different clipboardksjhfskdjfh
--vidfsdfs.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy from system clipboard' })
--vim.keydfsdfap.set({ 'n', 'x' }, '<leader>pp', '"+p', { desc = 'Copy from system clipboard' })
vim.keymap.set("n", "<leader>gw",
               "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
               { noremap = true, silent = true, desc = "Git - open git_worktrees selector" })
vim.keymap.set("n", "<leader>gW",
               "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
               { noremap = true, silent = true, desc = "Git - create git_worktree" })

-- git configuration
vim.keymap.set('v', '<leader>gs', ":'<,'>Gitsigns stage_hunk<cr>", { noremap = true, silent = true, desc = "Git - stage hunk" })
vim.keymap.set('n', '<leader>gs', ":Gitsigns stage_hunk<cr>", { noremap = true, silent = true, desc = "Git - stage hunk" })
vim.keymap.set('v', '<leader>gu', ":'<,'>Gitsigns undo_stage_hunk<cr>", { noremap = true, silent = true, desc = "Git - undo stage hunk" })
vim.keymap.set('n', '<leader>gu', ":Gitsigns undo_stage_hunk<cr>", { noremap = true, silent = true, desc = "Git - undo stage hunk" })

vim.keymap.set('n', '<leader>gn', ":Gitsigns next_hunk<CR>", { noremap = true, silent = true, desc = "Git - next hunk" })
vim.keymap.set('n', '<leader>gN', ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true, desc = "Git - prev hunk" })
vim.keymap.set('n', '<leader>gr', ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true, desc = "Git - reset hunk" })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true, desc = "Git - commit" })
vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>', { noremap = true, silent = true, desc = "Git - diff this" })
vim.keymap.set('n', '<leader>gg', ':Git<CR>', { noremap = true, silent = true, desc = "Git - diff this" })
--vim.keymap.set('n', '<leader>gb', ': Gitsigns diffthis<CR>', { noremap = true, silent = true, desc = "Git - diff this" })


vim.keymap.set('n', '<leader>ct', ': CloakToggle<CR>', { noremap = true, silent = true, desc = "Cloak toggle" })


-- keymaps for MarkdownPreview
vim.keymap.set('n', '<leader>mp', ': MarkdownPreview<CR>', { noremap = true, silent = true, desc = "MarkdownPreview" })
vim.keymap.set('n', '<leader>ms', ': MarkdownPreviewStop<CR>', { noremap = true, silent = true, desc = "MarkdownPreviewStop" })
vim.keymap.set('n', '<leader>mt', ': MarkdownPreviewToggle<CR>', { noremap = true, silent = true, desc = "MarkdownPreviewToggle" })

-- keymaps for toggle numbering
vim.keymap.set('n', '<leader>dn', '<cmd>set number!<CR><cmd>set relativenumber!<CR>', { noremap = true, silent = true, desc = "Disable number and relative number" })
vim.keymap.set('n', '<leader>en', '<cmd>set number<CR><cmd>set relativenumber<CR>', { noremap = true, silent = true, desc = "Enable number and relative number" })

