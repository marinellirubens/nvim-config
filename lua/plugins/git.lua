local opts = {
    { "tpope/vim-fugitive" },
    {
        --plugin to manage git worktrees
        'ThePrimeagen/git-worktree.nvim',
        config = function()
            require("git-worktree").setup()
            require("telescope").load_extension("git_worktree")
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    },
}

return opts
