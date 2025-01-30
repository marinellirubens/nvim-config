local opts
opts =  {
    "lukas-reineke/indent-blankline.nvim",
    ft = {'python', 'xml', 'lua', 'sql'},
    main = "ibl",
    opts = {},
    config = function()
        if vim.g.vscode then
            -- VSCode extension
            print("indent-blankline not started")
        else
            require("ibl").setup()
        end
    end,
}
return opts
