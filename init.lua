--import general keymap configurations
require("general.keymap")

--create basis for lazy loading
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.keymap.set("n", "<leader>lz", function()
    print(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
end, { desc = "Print lazy.nvim path" })

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--import plugins using lazy.nvim
require("lazy").setup("plugins")

--import general settings
require("general.set")
