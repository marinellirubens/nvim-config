local opts = {
    "lewis6991/gitsigns.nvim",
    config = function()
        --vim.api.nvim_set_hl(0, "GitSignsStagedAddNr", { bg = "#ffffff", fg = "#555555", sp= "#555555", reverse=true})
        require("gitsigns").setup{
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
            _signs_staged_enable = true, -- experimental

            signs = {
                add          = { hl = 'GitSignsAdd'   , text = '┃', numhl = 'GitSignsAddNr'   , linehl = 'GitSignsAddLn' },
                change       = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
                delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
                changedelete = { hl = 'GitSignsChange', text = '┃', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            },
            _signs_staged = {
                add          = { hl = 'GitSignsStagedAdd'   , text = '┋ ', numhl = 'GitSignsStagedAddNr'   , linehl = 'GitSignsStagedAddLn' },
                change       = { hl = 'GitSignsStagedChange', text = '┋ ', numhl = 'GitSignsStagedChangeNr', linehl = 'GitSignsStagedChangeLn' },
                delete       = { hl = 'GitSignsStagedDelete', text = '﹍', numhl = 'GitSignsStagedDeleteNr', linehl = 'GitSignsStagedDeleteLn' },
                topdelete    = { hl = 'GitSignsStagedDelete', text = '﹉', numhl = 'GitSignsStagedDeleteNr', linehl = 'GitSignsStagedDeleteLn' },
                changedelete = { hl = 'GitSignsStagedChange', text = '┋ ', numhl = 'GitSignsStagedChangeNr', linehl = 'GitSignsStagedChangeLn' },
            },

            diff_opts = {
                internal = true,
                algorithm = 'patience',
                indent_heuristic = true,
                linematch = 60,
                ignore_whitespace_change = false,
                ignore_blank_lines = false,
                ignore_whitespace = false,
                ignore_whitespace_change_at_eol = false,
            },

            debug_mode = true,
        }

    end,
}

return opts
