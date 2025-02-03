--LSP (auto complete)
return {
    'neovim/nvim-lspconfig',
    ft = vim.g.languages,
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'l3mon4d3/luasnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
        "folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup({})
        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pylsp", "yamlls" }
        })
        vim.lsp.handlers["textdocument/publishdiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics,
            {
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
            }
        )

        local on_attach = require('plugins.config.lsp_utils').on_attach
        local capabilities = require('plugins.config.lsp_utils').capabilities
        -- LSP settings.
        --  This function gets run when an LSP connects to a particular buffer.

        --  Add any additional override configuration in the following tables. They will be passed to
        --  the `settings` field of the server config. You must look up that documentation yourself.
        local servers = {
            pylsp = {
                pylsp = {
                    plugins = {
                    ruff = { enabled = false },
                    -- formatter options
                    black = { enabled = false },
                    autopep8 = { enabled = true },
                    flake8 = {
                        ignore = {'E251', 'W191', 'W391', 'E722'},
                        enabled = true,
                        maxLineLength = 120
                    },
                    basedpyright = { enabled = true },
                    yapf = { enabled = false },
                    -- linter options
                    pylint = {
                        enabled = false,
                        args = { '--disable=C0305' }
                    },
                    mccabe = { enabled = false },
                    pyflakes = { enabled = false },
                    pycodestyle = {
                        ignore = {'E251', 'W191', 'W391', 'E722'},
                        enabled = false, --because is already included in flake8
                        maxLineLength = 120
                    },
                    -- type checker
                    pylsp_mypy = {
                        enabled = false,
                        report_progress = true,
                        live_mode = true
                    },
                    -- auto-completion options
                    jedi_completion = { fuzzy = true },
                    pyls_isort = { enabled = false },
                },
              },
            },
            --tsserver = {},
            --
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }

        -- Ensure the servers above are installed
        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }

        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                }
            end,
        }

         --nvim-cmp setup
        local luasnip = require('luasnip')
        luasnip.config.setup {}

        local cmp = require('cmp')
        cmp.setup {
            completion = {
                autocomplete = false,  -- Enable auto-completion
                keyword_length = 1,   -- Minimum characters before suggestions show
                --completeopt = "menu,menuone,noinsert",
            },
            --performance = {
                --debounce = 300,  -- Delay in milliseconds before showing suggestions
            --},
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
        }

        --setup lsp for openapi
        local custom_lsp_attach = function(_, bufnr)
            print('LSP attached')
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end

        require'lspconfig'.yamlls.setup {
            settings = {
                yaml = {
                    schemaStore = {
                        url = "https://www.schemastore.org/api/json/catalog.json",
                        enable = true,
                    }
                }
            },
            on_attach = custom_lsp_attach
        }
    end
}
