local servers = {
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    ruff = { enabled = false },
                    black = { enabled = false },
                    autopep8 = { enabled = true },
                    flake8 = {
                        ignore = { "E251", "W191", "W391", "E722" },
                        enabled = true,
                        maxLineLength = 120,
                    },
                    basedpyright = { enabled = true },
                    yapf = { enabled = false },
                    pylint = {
                        enabled = true,
                        args = { "--disable=C0305" },
                    },
                    mccabe = { enabled = false },
                    pyflakes = { enabled = false },
                    pycodestyle = {
                        ignore = { "E251", "W191", "W391", "E722" },
                        enabled = false,
                        maxLineLength = 120,
                    },
                    pylsp_mypy = {
                        enabled = false,
                        report_progress = true,
                        live_mode = true,
                    },
                    jedi_completion = { fuzzy = true },
                    pyls_isort = { enabled = false },
                },
            },
        },
    },
    --tsserver = {},
    --
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },
    ols = {
        settings = {
            init_options = {
                --checker_args = "-strict-style",
                collections = {
                    { name = "shared", path = vim.fn.expand('$HOME/odin/bin') }
                },
            },
        },
    },
    gopls = {
        settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
              gofumpt = true,
            },
        },
    },
}

local function lsp_keymaps(bufnr)
    local function map(keys, rhs, desc)
        vim.keymap.set("n", keys, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
    end

    map("gd", vim.lsp.buf.definition, "Goto Definition")
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("gI", vim.lsp.buf.implementation, "Goto Implementation")
    map("gr", vim.lsp.buf.references, "Goto References")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
    map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
    map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
    map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
    map("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List Workspace Folders")

    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = bufnr, desc = "Diagnostics: Open Float" })
    vim.keymap.set("n", "<leader>ne", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end, { buffer = bufnr, desc = "Diagnostics: Next" })

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        vim.lsp.buf.format({ bufnr = bufnr })
    end, { desc = "Format current buffer with LSP" })
end

local function lsp_status()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local names = vim.tbl_map(function(client)
        return client.name
    end, clients)

    print(("filetype=%s clients=%s"):format(vim.bo.filetype, vim.inspect(names)))
end

local function lsp_completion(client, bufnr)
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
    end
end

local function setup_cmp()
    local cmp = require("cmp")

    vim.opt.completeopt = { "menu", "menuone", "noinsert" }

    cmp.setup({
        completion = {
            autocomplete = false,
            keyword_length = 1,
        },
        mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
        }, {
            { name = "buffer" },
        }),
    })
end

return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        lazy = false,
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/nvim-cmp",
            "l3mon4d3/luasnip",
            "saadparwaiz1/cmp_luasnip",
        },
        lazy = false,
        opts = {
            ensure_installed = vim.tbl_keys(servers),
            automatic_enable = false,
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
            setup_cmp()

            vim.diagnostic.config({
                severity_sort = true,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                },
                float = {
                    border = "rounded",
                    source = "if_many",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if ok then
                capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                callback = function(event)
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client then
                        lsp_completion(client, event.buf)
                    end

                    lsp_keymaps(event.buf)
                end,
            })

            vim.api.nvim_create_user_command("LspStatus", lsp_status, { desc = "Show LSP clients attached to this buffer" })

            for server, config in pairs(servers) do
                config.capabilities = capabilities
                vim.lsp.config(server, config)
            end

            vim.lsp.enable(vim.tbl_keys(servers))
        end,
    },
}
