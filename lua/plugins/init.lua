return 
{
    --'tpope/vim-obsession',
    { 'raddari/last-color.nvim' },
    'ThePrimeagen/git-worktree.nvim',
    { "folke/neoconf.nvim", cmd = "Neoconf" },
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
    {
        "preservim/vim-markdown",
        ft = "markdown",
    },
    "preservim/nerdcommenter",
    "tpope/vim-fugitive",
    --Language specific
    "fatih/vim-go",
    {
        "nvim-telescope/telescope-dap.nvim",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("telescope").load_extension("dap")
        end,
    },
    --debug
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function()
            require("dap-go").setup()
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        ft = vim.g.languages,
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" }
    },
}
