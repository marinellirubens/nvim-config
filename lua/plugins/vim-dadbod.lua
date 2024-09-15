return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },

        "Shougo/deoplete.nvim",
        "roxma/nvim-yarp",
        "roxma/vim-hug-neovim-rpc",
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
        vim.cmd[[autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni]]
        vim.cmd[[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]

        vim.g.dbs = {
            { name = 'LGBRTMST', url = 'oracle://30900011:LOmes9452@localhost:9006/LGBRTMST' },
            --{ name = 'staging', url = 'postgres://postgres:mypassword@localhost:5432/my-staging-db' },
            --{ name = 'wp', url = 'mysql://root@localhost/wp_awesome' },
        }
        -- dadbod ui saving location
        vim.g.db_ui_save_location=vim.env.HOME .. '/.nvim/dadbod-ui'
    end,
}
