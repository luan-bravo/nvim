return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        vim.keymap.set("n", "<leader>,w", ":Neorg workspace work<CR>")
        vim.keymap.set("n", "<leader>,h", ":Neorg workspace home<CR>")
    end,
}
