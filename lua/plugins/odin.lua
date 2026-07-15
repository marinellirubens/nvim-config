local opts = {
    'NANDquark/nvim-dap-odin', -- Use the correct path to your local plugin
    ft = {'odin'},
    name = "nvim-dap-odin",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        -- optionally override options by passing to setup({...})
        require("nvim-dap-odin").setup({
            build_command = "odin build",                      -- Base build command
            build_flags = "-debug",                          -- Flags for debug builds
            release_flags = "",                                -- Flags for release builds
            output_dir = nil,                                  -- Output directory (nil = project root)
            executable_extension = "",                         -- Auto-detected (.exe on Windows)
            main_file_patterns = { 'main.odin', '*.odin' },   -- Files to search for a main procedure
            main_proc_pattern = 'main%s*::%s*proc',           -- Pattern to find the main procedure
            notifications = true,                              -- Show build notifications
            max_search_depth = 10,                             -- Maximum parent directories to search
        })
    end,
}

opts = {}
return opts
