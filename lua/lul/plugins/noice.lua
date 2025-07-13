return {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- Notifications using mini and not notify
    dependencies = { "MunifTanjim/nui.nvim", "hrsh7th/nvim-cmp" },
    config = function()
        local noi_status_ok, noice = pcall(require, "noice")
        if not noi_status_ok then return end
        noice.setup({
            -- recommended configs
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                -- inc_rename = true, -- TODO: checkout inc-rename.nvim
                lsp_doc_border = true, -- noice boorders
            },

            cmdline = {
                view = "cmdline",
                format = {
                    search_down = {
                        view = "cmdline",
                    },
                    search_up = {
                        view = "cmdline",
                    },
                },
            },

            views = {
                -- TODO: figure out how come ricing is not being applied to popupmenu
                -- popupmenu = {
                --     relative = "editor",
                --     position = {
                --         row = 20,
                --         col = "50%",
                --     },
                --     size = {
                --         width = 60,
                --         height = 3,
                --     },
                --     border = {
                --         style = "rounded",
                --         padding = { 0, 1 },
                --     },
                --     win_options = {
                --         winhighlight = {
                --             Normal = "Normal",
                --             FloatBorder = "DiagnosticInfo"
                --         },
                --     },
                -- },
            },
        })

        local t_status_ok, telescope = pcall(require, "telescope")
        if not t_status_ok then return end
        telescope.load_extension("noice")

        vim.keymap.set("n", "<leader>pnc",function()
            vim.cmd.NoiceTelescope()
        end, { desc = "Telescope Noice" } )
    end
}
