local opts = {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    ft = vim.g.languages,
    config = function()

        require('nvim-treesitter').setup {
          -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
          install_dir = vim.fn.stdpath('data') .. '/site'
        }

        require("nvim-treesitter").install({ "python", "lua", "vim", "vimdoc", "query" })
    end,
}
--opts = { }
return opts
