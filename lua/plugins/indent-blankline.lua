local opts
opts =  {
    "lukas-reineke/indent-blankline.nvim",
    ft = {'python', 'xml', 'lua'},
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup()
    end,
}
return opts
