return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("telescope").setup {
            defaults = {
                --path_display = {'shorten'},
                layout_strategy = "horizontal",
                layout_config = {
                    vertical = {
                      width = 0.9,
                      height = 0.9
                    },
                    cursor = {
                      height = 0.9,
                      width = 0.9
                    },
                    horizontal = {
                      width = 0.9,
                      prompt_position = 'top',
                      preview_width = 0.8,
                      height = 0.9
                    },
                },
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
