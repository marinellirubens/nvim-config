local opts = {
    --plugin to render markdown on browser (requires lib grip installed via python [pip install grip] )
    {
        --markdown syntax highlight
        "preservim/vim-markdown",
        ft = "markdown",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    }
}

return opts
