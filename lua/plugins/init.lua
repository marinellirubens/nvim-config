return
{
    --plugin to render markdown on browser (requires lib grip installed via python [pip install grip] )
    { 'PratikBhusal/vim-grip' },
    {
        --markdown syntax highlight
        "preservim/vim-markdown",
        ft = "markdown",
    },
    -- cypher syntax highlight
    { 'neo4j-contrib/cypher-vim-syntax' },
    -- plugin to remember the color scheme
    { 'raddari/last-color.nvim' },
    -- dont remember why I included
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    -- terminal inside nvim
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    -- buffers as tabs
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{}
        end,
    },
    -- plugin to have multiple cursors
    { "mg979/vim-visual-multi" },
    {
        -- commentary on code utility
        "preservim/nerdcommenter",
        ft = vim.g.languages_extented
    },
}
