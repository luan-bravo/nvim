return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
        local neocodeium = require("neocodeium")
        neocodeium.setup()
        vim.keymap.set("i", "<C-q>", function() return neocodeium.accept() end)
        vim.keymap.set("i", "<C-w>", function() return neocodeium.accept_line() end)
        vim.keymap.set("i", "<C-a>", function() return neocodeium.accept_word() end)
        vim.keymap.set("i", "<C-x>", function() return neocodeium.clear() end)
        vim.keymap.set("i", "<C-d>", function() return neocodeium.next() end)
        vim.keymap.set("i", "<C-f>", function() return neocodeium.prev() end)
    end,
}
