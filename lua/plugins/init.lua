return {
    { "github/copilot.vim", priority=1000},
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
        config = function ()
            require("ibl").setup ()
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
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
    'pixelneo/vim-python-docstring',
    'tpope/vim-fugitive',
    --Language specific
    'fatih/vim-go',

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
    'nvim-telescope/telescope-dap.nvim',
    'iamcco/markdown-preview.nvim',
    'Shougo/deoplete.nvim',
    'roxma/nvim-yarp',
    'roxma/vim-hug-neovim-rpc',
}
