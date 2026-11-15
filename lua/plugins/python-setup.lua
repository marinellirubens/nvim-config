return {
    {
        -- dont forget to install the dependencies (pip install pynvim neovim debugpy)
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function()
            vim.env.PYENV_VERSION = vim.fn.system('pyenv version'):match('(%S+)%s+%(.-%)')
            local python = vim.fn.exepath("python")
            vim.g.python3_host_prog = python ~= "" and (python .. "\n") or ""
            require("dap-python").setup(vim.g.python3_host_prog, {})
        end,
    },
}
