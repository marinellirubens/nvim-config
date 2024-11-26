local opts = {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")
        --local map = vim.keymap.set
        local mappings = {
            { "rn", vim.lsp.buf.rename, desc="[R]e[n]ame" },
            { "ca", vim.lsp.buf.code_action, desc="[C]ode [A]ction" },
            { "wa", vim.lsp.buf.add_workspace_folder, desc="[W]orkspace [A]dd Folder" },
            { "wr", vim.lsp.buf.remove_workspace_folder, desc="[W]orkspace [R]emove Folder" },
            { "wl",
                function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end,
                desc="[W]orkspace [L]ist Folders",
            },
            { "D", vim.lsp.buf.type_definition, desc="Type [D]efinition" },
            { "ds", require("telescope.builtin").lsp_document_symbols, desc="[D]ocument [S]ymbols" },
            { "ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc="[W]orkspace [S]ymbols" },
            { "e",
                function()
                    vim.diagnostic.open_float()
                end,
                desc="",
            },
            { "ne", vim.diagnostic.goto_next, desc="[N]ext [E]rror" },
        }
        wk.add(mappings, { prefix = "<leader>" })

        local mappings2 = {
            { "gd", vim.lsp.buf.definition, desc="[G]oto [D]efinition" },
            { "gr", require("telescope.builtin").lsp_references, desc="[G]oto [R]eferences" },
            { "gI", vim.lsp.buf.implementation, desc="[G]oto [I]mplementation" },
            { "K", vim.lsp.buf.hover, desc="Hover Documentation" },
            { "gD", vim.lsp.buf.declaration, desc="[G]oto [D]eclaration" },
        }
        wk.add(mappings2)
        wk.setup()
    end,
}
return opts
