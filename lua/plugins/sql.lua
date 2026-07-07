return {
    {
        "nanotee/sqls.nvim",
        ft = { "sql", "mysql", "plsql" },
        dependencies = { "neovim/nvim-lspconfig"},
        config = function()
            local lsp_utils = require("plugins.config.lsp_utils")
            local connections = {}

            for _, db in ipairs(vim.g.dbs or {}) do
                local driver = db.url and db.url:match("^([^:]+)://")

                if driver then
                    table.insert(connections, {
                        driver = driver,
                        dataSourceName = db.url,
                    })
                end
            end

            vim.lsp.config("sqls", {
                capabilities = lsp_utils.capabilities,
                on_attach = function(client, bufnr)
                    lsp_utils.on_attach(client, bufnr)
                end,
                settings = {
                    sqls = {
                        connections = connections,
                    },
                },
            })

            vim.lsp.enable("sqls")
        end,
    },
}
