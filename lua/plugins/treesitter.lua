local opts = {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.10.0",
    ft = vim.g.languages,
    config = function()

        require('nvim-treesitter').setup {
          install_dir = vim.fn.stdpath('data') .. '/site'
        }
        require("nvim-treesitter").install({ "python", "lua", "vim", "vimdoc", "query" })
    end,
}
--opts = { }
return opts
