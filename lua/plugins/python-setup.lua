return {
    {
        -- dont forget to install the dependencies (pip install pynvim neovim debugpy)
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function()
            vim.env.PYENV_VERSION = vim.fn.system('pyenv version'):match('(%S+)%s+%(.-%)')
            vim.g.python3_host_prog = vim.fn.system("which python")
            require("dap-python").setup(vim.g.python3_host_prog, {})
        end,
    },
}
