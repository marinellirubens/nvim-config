return {
    {"github/copilot.vim", priority=1000},
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
        config = function ()
            require("ibl").setup ()
        end
    },
    {"folke/which-key.nvim", 
     config = function()
        require("which-key").setup()
     end
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    --{ "xiyaowong/transparent.nvim",
       --config = function ()
            --require("transparent").setup({
              --groups = { -- table: default groups
                --'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                --'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                --'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                --'SignColumn', 'CursorLineNr', 'EndOfBuffer',"NormalFloat",
              --},
              --extra_groups = {}, -- table: additional groups that should be cleared
              --exclude_groups = {}, -- table: groups you don't want to clear
            --})
        --end
    --},
    {'lewis6991/gitsigns.nvim', 
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

    'ellisonleao/gruvbox.nvim',
    'folke/tokyonight.nvim',
    'Mofiqul/dracula.nvim',
    'Rigellute/shades-of-purple.vim',
    'AlexvZyl/nordic.nvim',
    'pappasam/papercolor-theme-slim',
    'pappasam/papercolor-theme-slim',
    'sainnhe/sonokai',

    'pixelneo/vim-python-docstring',

    {   'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end
    },
    'neovim/nvim-lspconfig',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    {  'hrsh7th/nvim-cmp', dependencies = {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'},
        config = function()
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    virtual_text = true,
                    signs = true,
                    update_in_insert = false,
                    underline = true,
                }
            )

             --nvim-cmp setup
            local luasnip = require('luasnip')
            luasnip.config.setup {}

            local cmp = require('cmp')
            cmp.setup {
              snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
              },
              mapping = cmp.mapping.preset.insert {
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
                },
              },
              sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
              },
            }
        end
    },
    
    'tpope/vim-fugitive',
    --Language specific
    'fatih/vim-go',

    --debug
    'mfussenegger/nvim-dap',
    {'leoluz/nvim-dap-go',
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
    'nvim-telescope/telescope-dap.nvim',
    'iamcco/markdown-preview.nvim', 
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-ui',

    'kristijanhusak/vim-dadbod-completion',
    'Shougo/deoplete.nvim',
    'roxma/nvim-yarp',
    'roxma/vim-hug-neovim-rpc',
}
