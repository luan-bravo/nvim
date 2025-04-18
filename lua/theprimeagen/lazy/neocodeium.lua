return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
        local neocodeium = require("neocodeium")
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

        local commands = require("neocodeium.commands")
        --[[
        local cmp = require("cmp")
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
        vim.keymap.set("n", "<leader>ium", function() commands.toggle() end)
        vim.keymap.set("n", "<leader>chat", function() commands.chat() end)
        vim.keymap.set("i", "<C-q>", function() neocodeium.accept() end)
        vim.keymap.set("i", "<C-e>", function() neocodeium.accept_line() end)
        vim.keymap.set("i", "<C-r>", function() neocodeium.accept_word() end)
        vim.keymap.set("i", "<C-x>", function() neocodeium.clear() end)
        vim.keymap.set("i", "<C-d>", function() neocodeium.cycle_or_complete(-1) end)
        vim.keymap.set("i", "<C-f>", function() neocodeium.cycle_or_complete(1) end)

    end,
}
