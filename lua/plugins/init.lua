return 
{
    --'tpope/vim-obsession',
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    },
    "mg979/vim-visual-multi",
    "pixelneo/vim-python-docstring",
    "preservim/vim-markdown",
    "preservim/nerdcommenter",

    {
        "pixelneo/vim-python-docstring",
        init = function()
            vim.g.vim_python_docstring_format = "google"
            vim.cmd([[autocmd Filetype python nnoremap <leader>da <cmd>DocstringTypes<cr>]])
        end,
    },
    "tpope/vim-fugitive",
    --Language specific
    "fatih/vim-go",
    {
        "nvim-telescope/telescope-dap.nvim",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("telescope").load_extension("dap")
        end,
    },
    --debug
    "mfussenegger/nvim-dap",
    {
        "leoluz/nvim-dap-go",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function()
            require("dap-go").setup()
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function()
            require("dap-python").setup("/usr/bin/python3", {})
        end,
    },
    { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" } },
}
