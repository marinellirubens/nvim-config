local opts = {
    'nanotee/sqls.nvim',
    config = function ()
        vim.lsp.config('sqls', {
            on_attach = function(client, bufnr)
                require('sqls').on_attach(client, bufnr)
            end
        })
    end,
}


return opts
