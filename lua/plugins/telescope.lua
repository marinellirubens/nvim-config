return {
    "nvim-telescope/telescope.nvim",
    --tag = "0.2.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
        if ok and ts_parsers.ft_to_lang == nil then
            ts_parsers.ft_to_lang = function(ft)
                if vim.treesitter and vim.treesitter.language and vim.treesitter.language.get_lang then
                    return vim.treesitter.language.get_lang(ft) or ft
                end
                return ft
            end
        end

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
