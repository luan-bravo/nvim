return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
        local neocodeium = require("neocodeium")
        local excluded_filetypes = { "c", "cpp", "go", "rust", "kotlin", "ruby" }
        neocodeium.setup({
            -- Only enable neocodeium in non-excluded filetypes
            filter = function(bufnr)
                if not vim.tbl_contains(excluded_filetypes, vim.api.nvim_get_option_value('filetype', { buf = bufnr })) then
                    return true
                end
                return false
            end
        })
        vim.keymap.set("i", "<C-q>", function() return neocodeium.accept() end)
        vim.keymap.set("i", "<C-w>", function() return neocodeium.accept_line() end)
        vim.keymap.set("i", "<C-a>", function() return neocodeium.accept_word() end)
        vim.keymap.set("i", "<C-x>", function() return neocodeium.clear() end)
        vim.keymap.set("i", "<C-d>", function() return neocodeium.cycle_or_complete(-1) end)
        vim.keymap.set("i", "<C-f>", function() return neocodeium.cycle_or_complete(1) end)
    end,
}
