local opts =  {
    "epwalsh/obsidian.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "personal",
                    path = "~/obsidian_vault",
                },
            },
            -- Optional, configure additional syntax highlighting / extmarks.
            ui = {
                enable = true, -- set to false to disable all additional syntax features
                update_debounce = 20, -- update delay after a text change (in milliseconds)
                -- Define how various check-boxes are displayed
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    [""] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    --["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "green" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                    --["!"] = { char = "", hl_group = "ObsidianCyan" },
                    ["!"] = { char = "", hl_group = "ObsidianYellow" },

                    -- Replace the above with this if you don't have a patched font:
                    -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                    -- You can also add more custom ones...
                },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                -- Replace the above with this if you don't have a patched font:
                -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
                    ObsidianCyan = { fg = "#33e4ff" },
                    ObsidianYellow = { fg = "#ffff33" },
                },
            },
        })
    end,
}
--opts = {}
return opts
