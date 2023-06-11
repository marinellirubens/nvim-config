--Start/stop debugger (F17 is shift+F5)
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>1<CR><CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F17>", ":DapTerminate<CR>")

--debug steps walking
vim.keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")

--setting breakpoint (F21 is shift+F5)
vim.keymap.set("n", "<F21>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
--require('dap-python').setup()
require("dap-python").setup("python", {})
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.api.nvim_set_hl(0, "blue",   { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "green",  { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
vim.api.nvim_set_hl(0, "red",    { fg = "#993939" })

vim.fn.sign_define('DapBreakpoint',          { text='●', texthl='red',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='●', texthl='red',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',  { text='●', texthl='orange', linehl='DapBreakpoint', numhl='DapBreakpoint' })
