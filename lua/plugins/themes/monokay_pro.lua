return {
    'loctvl842/monokai-pro.nvim',
    lazy = true,
    --ft = {"lua"},
    config = function()
        require("monokai-pro").setup({
            transparent_background = false,
            terminal_colors = true,
            devicons = true, -- highlight the icons of `nvim-web-devicons`
            styles = {
                comment = { italic = true },
                keyword = { italic = true }, -- any other keyword
                type = { italic = true }, -- (preferred) int, long, char, etc
                storageclass = { italic = true }, -- static, register, volatile, etc
                structure = { italic = true }, -- struct, union, enum, etc
                parameter = { italic = true }, -- parameter pass in function
                annotation = { italic = true },
                tag_attribute = { italic = true }, -- attribute of tag in reactjs
            },
            filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
            inc_search = "background", -- underline | background
            background_clear = {
                -- "float_win",
                "toggleterm",
                "telescope",
                -- "which-key",
                "renamer",
                "notify",
                 "nvim-tree",
                -- "neo-tree",
                -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
            },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
            plugins = {
                bufferline = {
                    underline_selected = false,
                    underline_visible = false,
                },
                indent_blankline = {
                    context_highlight = "default", -- default | pro
                    context_start_underline = true,
                },
            },
        })
        --vim.cmd[[colorscheme monokai-pro]]
        --vim.cmd[[set termguicolors]]
        --vim.cmd[[set background=dark]]
    end
}
