return 
{
    --'tpope/vim-obsession',
    'neo4j-contrib/cypher-vim-syntax',
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
    {
        "preservim/nerdcommenter",
        ft = vim.g.languages_extented
    },
    "tpope/vim-fugitive",
}
