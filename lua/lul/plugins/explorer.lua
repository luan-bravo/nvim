return {
    {
        'stevearc/oil.nvim',
        opts = {},
        -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function ()
            local oil_ok, oil = pcall(require, "oil")
            if not oil_ok then return end
            oil.setup({
                default_file_explorer = true,
                columns = {
                    "icon",
                    -- "permissions",
                    -- "size",
                    -- "mtime",
                },
                -- Buffer-local options to use for oil buffers
                buf_options = {
                    buflisted = false,
                    bufhidden = "hide",
                },
                win_options = {
                    wrap = true,
                    signcolumn = "no",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                    conceallevel = 3,
                    concealcursor = "nvic",
                },

                --! to setup trash to $HOME/.trash
                delete_to_trash = true,

                --! Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
                skip_confirm_for_simple_edits = false,

                prompt_save_on_select_new_entry = true,

                cleanup_delay_ms = 2000,
                lsp_file_methods = {
                    enabled = true,
                    timeout_ms = 2000,
                    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
                    -- Set to "unmodified" to only save unmodified buffers
                    autosave_changes = false,
                },
                -- Constrain the cursor to the editable parts of the oil buffer
                -- Set to `false` to disable, or "name" to keep it on the file names
                constrain_cursor = "editable",
                -- Set to true to watch the filesystem for changes and reload oil
                watch_for_changes = false,
                -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
                -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
                -- Additionally, if it is a string that matches "actions.<name>",
                -- it will use the mapping at require("oil.actions").<name>
                -- Set to `false` to remove a keymap
                -- See :help oil-actions for a list of all available actions
                keymaps = {
                    ["g?"] = { "actions.show_help", mode = "n" },
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                    ["<C-t>"] = { "actions.select", opts = { tab = true } },
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = { "actions.close", mode = "n" },
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = { "actions.parent", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["`"] = { "actions.cd", mode = "n" },
                    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                    ["gs"] = { "actions.change_sort", mode = "n" },
                    ["gx"] = "actions.open_external",
                    ["g."] = { "actions.toggle_hidden", mode = "n" },
                    ["g\\"] = { "actions.toggle_trash", mode = "n" },
                },
                -- Set to false to disable all of the above keymaps
                use_default_keymaps = true,
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = false,
                    -- This function defines what is considered a "hidden" file
                    is_hidden_file = function(name, bufnr)
                        local m = name:match("^%.")
                        return m ~= nil
                    end,
                    -- This function defines what will never be shown, even when `show_hidden` is set
                    is_always_hidden = function(name, bufnr)
                        return false
                    end,
                    -- Sort file names with numbers in a more intuitive order for humans.
                    -- Can be "fast", true, or false. "fast" will turn it off for large directories.
                    natural_order = "fast",
                    -- Sort file and directory names case insensitive
                    case_insensitive = false,
                    sort = {
                        -- sort order can be "asc" or "desc"
                        -- see :help oil-columns to see which columns are sortable
                        { "type", "asc" },
                        { "name", "asc" },
                    },
                    -- Customize the highlight group for the file name
                    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                        return nil
                    end,
                },
                -- Extra arguments to pass to SCP when moving/copying files over SSH
                extra_scp_args = {},
                -- EXPERIMENTAL support for performing file operations with git
                git = {
                    -- Return true to automatically git add/mv/rm files
                    add = function(path)
                        return false
                    end,
                    mv = function(src_path, dest_path)
                        return false
                    end,
                    rm = function(path)
                        return false
                    end,
                },
                -- Configuration for the floating window in oil.open_float
                float = {
                    -- Padding around the floating window
                    padding = 2,
                    -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    max_width = 0,
                    max_height = 0,
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                    },
                    -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
                    get_win_title = nil,
                    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
                    preview_split = "auto",
                    -- This is the config that will be passed to nvim_open_win.
                    -- Change values here to customize the layout
                    override = function(conf)
                        return conf
                    end,
                },
                -- Configuration for the file preview window
                preview_win = {
                    -- Whether the preview window is automatically updated when the cursor is moved
                    update_on_cursor_moved = true,
                    -- How to open the preview window "load"|"scratch"|"fast_scratch"
                    preview_method = "fast_scratch",
                    -- A function that returns true to disable preview on a file e.g. to avoid lag
                    disable_preview = function(filename)
                        return false
                    end,
                    -- Window-local options to use for preview window buffers
                    win_options = {},
                },
                -- Configuration for the floating action confirmation window
                confirmation = {
                    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- min_width and max_width can be a single value or a list of mixed integer/float types.
                    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
                    max_width = 0.9,
                    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
                    min_width = { 40, 0.4 },
                    -- optionally define an integer/float for the exact width of the preview window
                    width = nil,
                    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- min_height and max_height can be a single value or a list of mixed integer/float types.
                    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
                    max_height = 0.9,
                    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
                    min_height = { 5, 0.1 },
                    -- optionally define an integer/float for the exact height of the preview window
                    height = nil,
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                    },
                },
                -- Configuration for the floating progress window
                progress = {
                    max_width = 0.9,
                    min_width = { 40, 0.4 },
                    width = nil,
                    max_height = { 10, 0.9 },
                    min_height = { 5, 0.1 },
                    height = nil,
                    border = "rounded",
                    minimized_border = "none",
                    win_options = {
                        winblend = 0,
                    },
                },
                -- Configuration for the floating SSH window
                ssh = {
                    border = "rounded",
                },
                -- Configuration for the floating keymaps help window
                keymaps_help = {
                    border = "rounded",
                },
            })
        end
    },
    {
        -- "nvim-tree/nvim-tree.lua",
        -- version = "*",
        -- event = "VeryLazy",
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        -- config = function()
        --     vim.g.loaded_netrw = 1
        --     vim.g.loaded_netrwPlugin = 1
        --     local nt_status_ok, tree = pcall(require, "nvim-tree")
        --     if not nt_status_ok then return end
        --     tree.setup({
        --         auto_reload_on_write = true,
        --         hijack_cursor = true,
        --         hijack_netrw = true,
        --         sort = {
        --             sorter = "name",
        --             folders_first = true,
        --             files_first = false,
        --         },
        --         sync_root_with_cwd = true,
        --         view = {
        --             width = 30,
        --             cursorline = true,
        --             side = "left",
        --             relativenumber = false,
        --             signcolumn = "yes",
        --         },
        --         renderer = {
        --             icons = {
        --                 web_devicons = {
        --                     file = {
        --                         enable = true,
        --                         color = true,
        --                     },
        --                     folder = {
        --                         enable = true,
        --                         color = true,
        --                     },
        --                 },
        --                 glyphs = {
        --                     default = "",
        --                     symlink = "",
        --                     bookmark = "󰆤",
        --                     modified = "●",
        --                     hidden = "󰜌",
        --                     folder = {
        --                         arrow_closed = "",
        --                         arrow_open = "",
        --                         default = "",
        --                         open = "",
        --                         empty = "",
        --                         empty_open = "",
        --                         symlink = "",
        --                         symlink_open = "",
        --                     },
        --                     git = {
        --                         unstaged = "", -- \uf006
        --                         staged = "", -- \uf005
        --                         unmerged = "",
        --                         renamed = "➜",
        --                         untracked = "", -- \uf29c
        --                         deleted = "",
        --                         ignored = "◌",
        --                     },
        --                 },
        --             },
        --             special_files = {
        --                 "Cargo.toml",
        --                 "Makefile",
        --                 "README.md",
        --                 "readme.md",
        --             },
        --             symlink_destination = true,
        --         },
        --         -- (?)
        --         system_open = {
        --             cmd = "",
        --             args = {},
        --         },
        --         git = {
        --             enable = true,
        --             show_on_dirs = true,
        --             show_on_open_dirs = true,
        --             disable_for_dirs = {},
        --             timeout = 400,
        --             cygwin_support = false,
        --         },
        --         actions = {
        --             use_system_clipboard = true,
        --         },
        --
        --     })
        --     local api_status_ok, api = pcall(require, "nvim-tree.api")
        --     if not api_status_ok then return end
        --     vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "NvimTree toggle" })
        -- end,
    }
}
