return {
    "lukas-reineke/indent-blankline.nvim",
    ft = vim.g.languages,
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup()
    end,
}
