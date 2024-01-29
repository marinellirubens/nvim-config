return {
    {
        "pixelneo/vim-python-docstring",
        ft="python"
    },
    {
        "pixelneo/vim-python-docstring",
        ft = "python",
        init = function()
            vim.g.vim_python_docstring_format = "google"
            vim.cmd([[autocmd Filetype python nnoremap <leader>da <cmd>DocstringTypes<cr>]])
        end,
    },
}
