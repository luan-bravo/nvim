return {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- Notifications using mini and not notify
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function(_, opts)
        local noi_status_ok, noice = pcall(require, "noice")
        if not noi_status_ok then return end
        noice.setup(opts)
        local t_status_ok, telescope = pcall(require, "telescope")
        if not t_status_ok then return end
        telescope.load_extension("noice")
        vim.keymap.set("n", "<leader>pnc",function()
            vim.cmd.NoiceTelescope()
        end, { desc = "Telescope Noice" } )
    end
}
