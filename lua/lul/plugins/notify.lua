return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
        background_colour = "#000000",
        timeout = 1700,
    },
    config = function(_, opts)
        local t_status_ok, telescope = pcall(require, "telescope")
        if not t_status_ok then return end
        local n_status_ok, notify = pcall(require, "notify")
        if not n_status_ok then return end
        telescope.load_extension("notify")
        notify.setup(opts)
        vim.keymap.set("n", "<leader>pnf",function()
            vim.cmd.Telescope("notify")
        end, { desc = "Telescope Notify" } )
    end,
}
