return {
    "Exafunction/codeium.vim",

    config = function()
        -- disable codeium by default
        vim.g.codeium_enabled = false
        vim.keymap.set("i", "<C-q>", function()
            return vim.fn["codeium#Accept"]()
        end, { expr = true })
        vim.keymap.set("i", "<C-d>", function()
            return vim.fn["codeium#CycleCompletions"](5)
        end, { expr = true })
        vim.keymap.set("i", "<C-f>", function()
            return vim.fn["codeium#CycleCompletions"](3)
        end, { expr = true })
        vim.keymap.set("i", "<C-x>", function()
            return vim.fn["codeium#Clear"]()
        end, { expr = true })
    end
}
