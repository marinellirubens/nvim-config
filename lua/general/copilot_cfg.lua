
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#b3ecff", bg = "#555555" })
vim.g.copilot_assume_mapped = true
vim.g.copilot_filetypes = {
    ["*"] = true,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = true,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["yaml"] = true,
    ["markdown"] = true,
    ["python"] = true,
}
vim.keymap.set("i", "<C-j>", "copilot#Next()", {expr=true, silent=true})
vim.keymap.set("i", "<C-k>", "copilot#Previous()", {expr=true, silent=true})
vim.api.nvim_set_keymap("i", "<M-.>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

if vim.fn.has("mac") == 1 then
    vim.g.copilot_no_tab_map = false
else
    vim.g.copilot_no_tab_map = true
end
