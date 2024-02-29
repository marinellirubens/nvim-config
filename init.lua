--import general keymap configurations
require("general.keymap")
vim.g.languages = { "go", "python", "javascript", "typescript", "rust", "cpp", "c", "java", "lua", "tmux", "sshconfig", "cypher" }

local extended = {'markdown', 'vim', 'json', 'yaml', 'toml', 'zsh', 'dosini', 'conf'}
vim.g.languages_extended = vim.tbl_extend('force', vim.g.languages, extended)
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
require("lazy").setup({
  {import = "plugins"},
  {import = "plugins.themes"},
})
--require("lazy").setup("plugins.themes")

--import general settings
require("general.set")
require("general.theme")
