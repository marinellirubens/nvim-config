return
{
    --'tpope/vim-obsession',
    'neo4j-contrib/cypher-vim-syntax',
    {
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher",
        config = function ()
            require("swagger-preview").setup({
                -- The port to run the preview server on
                port = 8000,
                -- The host to run the preview server on
                host = "localhost",
            })
        end
    },
    { 'raddari/last-color.nvim' },
    {
        'ThePrimeagen/git-worktree.nvim',
        config = function()
            require("git-worktree").setup()
            require("telescope").load_extension("git_worktree")
        end,
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{}
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
