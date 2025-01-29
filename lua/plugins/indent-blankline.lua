local opts
opts =  {
    "lukas-reineke/indent-blankline.nvim",
    ft = {'python', 'xml', 'lua', 'sql'},
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup()
    end,
}
return opts
