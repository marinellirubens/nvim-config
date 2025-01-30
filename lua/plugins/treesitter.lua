local opts = {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    ft = vim.g.languages,
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "python", "lua", "vim", "vimdoc", "query" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            -- List of parsers to ignore installing (for "all")
            ignore_install = { "javascript", "markdown" },

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            --parser_install_dir = "~/.config/treesitter/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
            indent = {
                enable = false,
                disable = { "python" },
            },
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = { "python" },
            },
        })
    end,
}

return opts
