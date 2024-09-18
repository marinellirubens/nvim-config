local opts = {
    --plugin to render markdown on browser (requires lib grip installed via python [pip install grip] )
    { 'PratikBhusal/vim-grip' },
    {
        --markdown syntax highlight
        "preservim/vim-markdown",
        ft = "markdown",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}

return opts
