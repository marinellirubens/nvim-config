local opts = {
    'neovim/nvim-lspconfig',
    ft = vim.g.languages_reduced,
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
            ensure_installed = {}
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

        -- LSP settings.
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=bufnr, desc='[R]e[n]ame'})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {buffer=bufnr, desc='[C]ode [A]ction'})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=bufnr, desc='[G]oto [D]efinition'})
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            nmap('<Leader>e', function()
              vim.diagnostic.open_float()
            end, '')
            nmap('<Leader>ne', vim.diagnostic.goto_next)
            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            --nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        --  Add any additional override configuration in the following tables. They will be passed to
        --  the `settings` field of the server config. You must look up that documentation yourself.
        local servers = {
            --pylsp = {
                --pylsp = {
                    --plugins = {
                    ---- formatter options
                    --black = { enabled = false },
                    --autopep8 = { enabled = false },
                    --yapf = { enabled = false },

                    ---- linter options
                    --pylint = { enabled = true, executable = "pylint" },
                    --pyflakes = { enabled = true },
                    --pycodestyle = { 
                    --ignore = {'E251', 'W191', 'W391', 'E722'},
                        --enabled = true,
                        --maxLineLength = 120
                    --},
                    ---- type checker
                    --pylsp_mypy = {
                        --enabled = true,
                        --report_progress = true,
                        --live_mode = true
                    --},
                    ---- auto-completion options
                    --jedi_completion = { fuzzy = false },

                    --pyls_isort = { enabled = false },
                --},
              --},
            --},
            --tsserver = {},
            pyright = {},
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = false
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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

return opts

