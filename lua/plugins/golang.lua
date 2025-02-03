-- DEPRECATED
local opts = {
    {
        "ray-x/go.nvim",
        ft = {"go", 'gomod'},
        dependencies = {  -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup{
              go='go', -- go command, can be go[default] or e.g. go1.18beta1
              goimports ='gopls', -- goimports command, can be gopls[default] or either goimports or golines if need to split long lines
              gofmt = 'gofmt', -- gofmt through gopls: alternative is gofumpt, goimports, golines, gofmt, etc
            }
        end,
        --event = {"CmdlineEnter"},
        --build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "leoluz/nvim-dap-go",
        ft = {"go", 'gomod'},
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function()
            require("dap-go").setup()
        end,
    },
}
--opts = {}
return opts
