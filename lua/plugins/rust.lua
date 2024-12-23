return {
  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
    --{
      --'mrcjkb/rustaceanvim',
      --version = '^5', -- Recommended
      --lazy = false, -- This plugi    ft = { "rust" },
      --dependencies = "neovim/nvim-lspconfig",
      ----config = function()
        ----local on_attach = require('plugins.config.lsp_utils').on_attach
        ----local capabilities = vim.lsp.protocol.make_client_capabilities()
        ----capabilities.textDocument.completion.completionItem.snippetSupport = false
        ----capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        ----vim.g.rustaceanvim = {
          ----server = {
            ----on_attach = on_attach,
            ----capabilities = capabilities,
          ----}
        ----}
      ----end,
      --['rust-analyser'] = {
          --cargo = {
              --allFeatures = true,
          --}
      --}
    --},

}
