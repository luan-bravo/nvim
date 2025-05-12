return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local n_status_ok, notify = pcall(require, "notify")
        if not n_status_ok then return end
        notify.setup({
            background_colour = "#000000",
            timeout = 1000,
            fps = 60,
            top_down = false,
            level = 2,
            minimum_width = 0,
            max_width = 35,
            max_height = 10,
            render = "wrapped-compact",
            stages = "fade_in_slide_out",
            time_formats = {
                notification = "%T",
                notification_history = "%FT%T"
            },
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
        })
        local t_status_ok, telescope = pcall(require, "telescope")
        if not t_status_ok then return end
        telescope.load_extension("notify")
        vim.keymap.set("n", "<leader>pnf",function()
            vim.cmd.Telescope("notify")
        end, { desc = "Telescope Notify" } )
    end,
}
