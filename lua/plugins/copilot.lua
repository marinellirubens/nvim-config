-- DEPRECATED
local opts = {
    "zbirenbaum/copilot.lua",
    priority = 1000,
    ft = { "yaml", "markdown", "gitcommit", "gitrebase","python", "go", "javascript", "swagger", "xml", "lua", "html" },
    config = function()
        vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })

        local accept_key = ''
        if vim.fn.has("mac") == 1 then
            accept_key = "<TAB>"
        else
            accept_key = "<M-.>"
        end
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
                    accept = accept_key,
                    accept_word = false,
                    accept_line = false,
                    next = "<C-j>",
                    prev = "<C-k>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                yaml = true,
                html = true,
                markdown = true,
                help = false,
                gitcommit = true,
                gitrebase = true,
                hgcommit = false,
                svn = false,
                cvs = false,
                python = true,
                go = true,
                javascript = true,
                swagger = true,
                xml = true,
                lua = true,
                ["*"] = false,
            },
            copilot_node_command = "node", -- Node.js version must be > 18.x
            server_opts_overrides = {},
        })
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })
    end,
}
opts = {}
return opts
