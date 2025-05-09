return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
        local nc_status_ok, neocodeium = pcall(require, "neocodeium")
        if not nc_status_ok then return end
        local excluded_filetypes = { "c", "cpp", "go", "rust", "kotlin", "ruby" }
        neocodeium.setup({
            -- neocodeium off by default
            enabled = false,
            debounce = true,
            -- Only enable neocodeium in non-excluded filetypes
            filter = function(bufnr)
                if not vim.tbl_contains(excluded_filetypes, vim.api.nvim_get_option_value('filetype', { buf = bufnr })) then
                    return true
                end
                return false
            end,
        })

        local cmd_status_ok, commands = pcall(require, "neocodeium.commands")
        if not cmd_status_ok then return end
        --[[
        local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then return end
        cmp.event:on("menu_opened", function()
            neocodeium.clear()
        end)

        neocodeium.setup({
            filter = function()
                return not cmp.visible()
            end,
        })

        cmp.setup({
            completion = {
                autocomplete = false,
            },
        })
        ]]

        -- not working; TODO: fix this, lua lsp and lua cmp
        vim.keymap.set("n", "<leader>ium", function() commands.toggle() end, { desc = "NeoCodeium toggle " })
        vim.keymap.set("n", "<leader>chat", function() commands.chat() end, { desc = "NeoCodeium chat " })
        vim.keymap.set("i", "<C-q>", function() neocodeium.accept() end, { desc = "NeoCodeium accept " })
        vim.keymap.set("i", "<C-e>", function() neocodeium.accept_line() end, { desc = "NeoCodeium accept_line " })
        vim.keymap.set("i", "<C-r>", function() neocodeium.accept_word() end, { desc = "NeoCodeium accept_word " })
        vim.keymap.set("i", "<C-x>", function() neocodeium.clear() end, { desc = "NeoCodeium clear " })
        vim.keymap.set("i", "<C-d>", function() neocodeium.cycle_or_complete(-1) end, { desc = "NeoCodeium cycle_or_complete -1" })
        vim.keymap.set("i", "<C-f>", function() neocodeium.cycle_or_complete(1) end, { desc = "NeoCodeium cycle_or_complete 1" })

    end,
}
