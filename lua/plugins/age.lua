return {
    name = "local-age",
    dir = vim.fn.stdpath("config"),
    config = function()
        local age_group = vim.api.nvim_create_augroup("customAge", { clear = true })

        local function get_identity_file()
            return vim.g.age_identity_file or vim.fn.expand("~/.config/age/key.txt")
        end

        local function get_recipient()
            if vim.g.age_recipient and vim.g.age_recipient ~= "" then
                return vim.g.age_recipient
            end

            local identity = get_identity_file()
            local ok, lines = pcall(vim.fn.readfile, identity)
            if not ok then
                return nil
            end

            for _, line in ipairs(lines) do
                local key = line:match("^#%s*public key:%s*(%S+)")
                if key then
                    return key
                end
            end

            return nil
        end

        local function notify_error(message)
            vim.notify(message, vim.log.levels.ERROR)
        end

        local function notify_info(message)
            vim.notify(message, vim.log.levels.INFO)
        end

        vim.api.nvim_create_user_command("AgeCreateRecipient", function()
            local identity = get_identity_file()
            if vim.fn.filereadable(identity) == 1 then
                notify_info("file already created")
                return
            end

            vim.fn.mkdir(vim.fn.fnamemodify(identity, ":h"), "p")
            local result = vim.system({ "age-keygen", "-o", identity }):wait()
            if result.code ~= 0 then
                notify_error("age-keygen failed: " .. (result.stderr or ""))
                return
            end

            notify_info("created age key at " .. identity)
        end, {})

        vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
            pattern = "*.age",
            group = age_group,
            callback = function()
                vim.opt.shada = ""
                vim.opt_local.swapfile = false
                vim.opt_local.undofile = false
                vim.opt_local.backup = false
                vim.opt_local.writebackup = false
                vim.opt_local.bin = true
            end,
        })

        vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
            pattern = "*.age",
            group = age_group,
            callback = function()
                local path = vim.fn.expand("%:p")
                if vim.fn.filereadable(path) == 0 or vim.fn.getfsize(path) <= 0 then
                    vim.opt_local.bin = false
                    return
                end

                local identity = get_identity_file()
                if vim.fn.filereadable(identity) == 0 then
                    notify_error("age decrypt failed: identity file not found: " .. identity)
                    return
                end

                local result = vim.system({ "age", "-d", "-i", identity, path }):wait()
                if result.code ~= 0 then
                    notify_error("age decrypt failed: " .. (result.stderr or ""))
                    return
                end

                local output_lines = vim.split(result.stdout or "", "\n", { plain = true })
                if #output_lines > 0 and output_lines[#output_lines] == "" then
                    table.remove(output_lines, #output_lines)
                end

                local buf = vim.api.nvim_get_current_buf()
                vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)
                vim.api.nvim_buf_set_option(buf, "modified", false)
                vim.opt_local.bin = false
            end,
        })

        vim.api.nvim_create_autocmd({ "BufWriteCmd", "FileWriteCmd" }, {
            pattern = "*.age",
            group = age_group,
            callback = function()
                local recipient = get_recipient()
                if not recipient then
                    notify_error("age encrypt failed: recipient not found; set vim.g.age_recipient")
                    return
                end

                local buf = vim.api.nvim_get_current_buf()
                local path = vim.api.nvim_buf_get_name(buf)
                local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
                local input = table.concat(lines, "\n")

                local result = vim.system({ "age", "-r", recipient, "-o", path }, { stdin = input }):wait()
                if result.code ~= 0 then
                    notify_error("age encrypt failed: " .. (result.stderr or ""))
                    return
                end

                vim.api.nvim_buf_set_option(buf, "modified", false)
            end,
        })
    end,
}
