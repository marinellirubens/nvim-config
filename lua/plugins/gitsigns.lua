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
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                -- Actions
                --map('n', '<leader>hs', gitsigns.stage_hunk)
                --map('n', '<leader>hr', gitsigns.reset_hunk)
                --map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                --map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                --map('n', '<leader>hS', gitsigns.stage_buffer)
                --map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                --map('n', '<leader>hR', gitsigns.reset_buffer)
                --map('n', '<leader>hp', gitsigns.preview_hunk)
                --map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
                --map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                --map('n', '<leader>hd', gitsigns.diffthis)
                --map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                --map('n', '<leader>td', gitsigns.toggle_deleted)

                ---- Text object
                --map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    end,
}

return opts
