return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local lln_status_ok, lualine = pcall(require, "lualine")
        if not lln_status_ok then return end

        local function recording_register()
            local reg = vim.fn.reg_recording()
            if reg == "" then return reg end
            return "RECORDING @" .. reg
        end
        lualine.setup({
            options = { theme = "gruvbox", },
            sections = {
                lualine_a = { recording_register, "mode" },
                lualine_b = { "branch", "diff" },
                -- TODO: Display ongoing unfinished key combos
                -- lualine_c = { "filename", "showcmd", }, <- did not work
                lualine_c = { "filename", },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location", },
            },
        })
    end
}
