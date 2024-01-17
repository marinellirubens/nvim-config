return {
    { "github/copilot.vim", priority=1000},
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
        config = function ()
            require("ibl").setup ()
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            local map = vim.keymap.set
            local mappings = {
              rn = {vim.lsp.buf.rename, '[R]e[n]ame'},
              ca = {vim.lsp.buf.code_action, '[C]ode [A]ction'},
              wa = {vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder'},
              wr = {vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder'},
              wl = {function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
              end, '[W]orkspace [L]ist Folders'},
              D = {vim.lsp.buf.type_definition, 'Type [D]efinition'},
              ds = {require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols'},
              ws = {require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols'},
              e = {function()
                  vim.diagnostic.open_float()
              end, ''},
              ne = {vim.diagnostic.goto_next, '[N]ext [E]rror'},
            }
            wk.register(mappings, {prefix = '<leader>'})

            local mappings2 = {
              gd = {vim.lsp.buf.definition, '[G]oto [D]efinition'},
              gr = {require('telescope.builtin').lsp_references, '[G]oto [R]eferences'},
              gI = {vim.lsp.buf.implementation, '[G]oto [I]mplementation'},
              K = {vim.lsp.buf.hover, 'Hover Documentation'},
              gD = {vim.lsp.buf.declaration, '[G]oto [D]eclaration'},
            }
            wk.register(mappings2)
            wk.setup()
        end
    },
    { 'akinsho/toggleterm.nvim', version = "*", config = true},
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end
    },
    'pixelneo/vim-python-docstring',
    'preservim/nerdcommenter',

    --'ellisonleao/gruvbox.nvim',
    --'folke/tokyonight.nvim',
    --'Mofiqul/dracula.nvim',
    --'Rigellute/shades-of-purple.vim',
    --'AlexvZyl/nordic.nvim',
    --'pappasam/papercolor-theme-slim',
    {
        'pixelneo/vim-python-docstring',
        init = function()
            vim.g.vim_python_docstring_format = 'google'
            vim.cmd[[autocmd Filetype python nnoremap <leader>da <cmd>DocstringTypes<cr>]]
        end
    },
    'tpope/vim-fugitive',
    --Language specific
    'fatih/vim-go',

    {
        'nvim-telescope/telescope-dap.nvim',
        dependencies = {'mfussenegger/nvim-dap'},
        config = function()
            require('telescope').load_extension('dap')
        end
    },
    'iamcco/markdown-preview.nvim',
    --debug
    'mfussenegger/nvim-dap',
    {
        'leoluz/nvim-dap-go',
        dependencies = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'},
        config = function()
            require('dap-go').setup()
        end
    },
    {  'mfussenegger/nvim-dap-python',
        dependencies = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'},
        config = function()
            require("dap-python").setup("/usr/bin/python3", {})
        end
    },
    {   'theHamsta/nvim-dap-virtual-text',
        dependencies = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'}
    },
}
