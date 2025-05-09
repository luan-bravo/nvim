return {
    {
        "folke/trouble.nvim",
        config = function()
            local trb_status_ok, trouble = pcall(require, "trouble")
            if not trb_status_ok then return end
            trouble.setup({
                icons = false,
            })
            vim.keymap.set("n", "<leader>tt", function()
                trouble.toggle()
            end, { desc = "Trouble toggle" })
            vim.keymap.set("n", "[t", function()
                trouble.next({skip_groups = true, jump = true});
            end, { desc = "Trouble next" })
            vim.keymap.set("n", "]t", function()
                trouble.previous({skip_groups = true, jump = true});
            end, { desc = "Trouble previous" })
        end
    },
}
