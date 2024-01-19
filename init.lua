
require('general.keymap')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.keymap.set("n", "<leader>lz", function ()
  print(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
end, {desc = "Print lazy.nvim path"})

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

require("lazy").setup("plugins")

require('general.set')
--require("general.copilot_cfg")
