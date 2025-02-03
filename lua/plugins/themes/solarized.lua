return {
  'maxmx03/solarized.nvim',
  ft = {'lua'},
  lazy = false,
  priority = 1000,
  ---@type solarized.config
  opts = {},
  config = function(_, opts)
    vim.o.termguicolors = true
    require('solarized').setup(opts)
    --vim.o.background = 'light'
    --vim.cmd.colorscheme 'solarized'
  end,
}
