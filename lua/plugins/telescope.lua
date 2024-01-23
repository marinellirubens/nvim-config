return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("telescope").setup {
            defaults = {
                file_ignore_patterns = {
                    '.git/',
                    '__pycache__/',
                    'node_modules/',
                    '.venv/',
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    no_ignore = true
                },
            },
        }
    end
}
