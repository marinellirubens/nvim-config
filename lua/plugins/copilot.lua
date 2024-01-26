return {
    "zbirenbaum/copilot.lua",
    priority = 1000,
    config = function()
        vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<M-.>",
                    accept_word = false,
                    accept_line = false,
                    next = "<C-j>",
                    prev = "<C-k>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                yaml = true,
                markdown = true,
                help = false,
                gitcommit = true,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["*"] = true,
            },
            copilot_node_command = "node", -- Node.js version must be > 18.x
            server_opts_overrides = {},
        })
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })
    end,
}
