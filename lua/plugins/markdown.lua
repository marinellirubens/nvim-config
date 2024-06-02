local opts = {
    --plugin to render markdown on browser (requires lib grip installed via python [pip install grip] )
    { 'PratikBhusal/vim-grip' },
    {
        --markdown syntax highlight
        "preservim/vim-markdown",
        ft = "markdown",
    },
}

return opts
