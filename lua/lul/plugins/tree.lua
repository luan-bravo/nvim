return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() 
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        local nt_status_ok, tree = pcall(require, "nvim-tree")
        if not nt_status_ok then return end
        tree.setup({
            auto_reload_on_write = true,
            hijack_cursor = true,
            hijack_netrw = true,
            sort = {
                sorter = "name",
                folders_first = true,
                files_first = false,
            },
            sync_root_with_cwd = true,
            view = {
                width = 30,
                cursorline = true,
                side = "left",
                relativenumber = false,
                signcolumn = "yes",
            },
            renderer = {
                icons = {
                    web_devicons = {
                        file = {
                            enable = true,
                            color = true,
                        },
                        folder = {
                            enable = true,
                            color = true,
                        },
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "󰆤",
                        modified = "●",
                        hidden = "󰜌",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "", -- \uf006
                            staged = "", -- \uf005
                            unmerged = "",
                            renamed = "➜",
                            untracked = "", -- \uf29c
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
                special_files = {
                    "Cargo.toml",
                    "Makefile",
                    "README.md",
                    "readme.md",
                },
                symlink_destination = true,
            },
            -- (?)
            system_open = {
                cmd = "",
                args = {},
            },
            git = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                disable_for_dirs = {},
                timeout = 400,
                cygwin_support = false,
            },
            actions = {
                use_system_clipboard = true,
            },

        })
        local api_status_ok, api = pcall(require, "nvim-tree.api")
        if not api_status_ok then return end
        vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "NvimTree toggle" })
    end,
}
