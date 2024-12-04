return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("telescope").setup {
            defaults = {
                path_display = {'shorten'},
                layout_strategy = "cursor",
                --layout_config = {
                  --horizontal = {
                    --size = {
                      --width = "90%",
                      --height = "60%",
                    --},
                  --},
                  --vertical = {
                    --size = {
                      --width = "90%",
                      --height = "90%",
                    --},
                  --},
                --},
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
