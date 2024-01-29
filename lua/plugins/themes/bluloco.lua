return {
  'uloco/bluloco.nvim',
  lazy=true,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    -- your optional config goes here, see below.
    require("bluloco").setup({
      style = "auto",               -- "auto" | "dark" | "light"
      transparent = false,
      italics = false,
      terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
      guicursor   = true,
    })
  end
}
