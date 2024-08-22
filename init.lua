--import general configurations
vim.g.languages = {"go", "python", "javascript", "lua", "tmux", "sshconfig", "cypher", "sh", "sql"}

vim.g.languages_sub = {
    "go", "python", "javascript", "lua", "tmux", "sshconfig", "cypher", "sh", "sql",
    "markdown", "vim", "json", "yaml", "toml", "zsh", "dosini", "conf", "sequence"
}

require("general.keymap")
require("general.set")

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
local lazy_setup = require('general.lazy_setup')
require("lazy").setup(lazy_setup)
--require("lazy").setup("plugins.themes")

--import general settings
require("general.theme")
