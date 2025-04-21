return {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim", },
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    opts = { },
    config = function()
        local obsidian = require("obsidian")
        obsidian.setup({
            workspaces = {
                { name = "personal", path = "~/notes/personal", },
                { name = "classes", path = "~/notes/classes", },
                { name = "studies", path = "~/notes/studies", },
            },
            -- Only for .md

            -- TODO: fix toggle_checkbox
                --[[
                    E5108: Error executing lua: ...ocal/share/nvim/lazy/obsidian.nvim/lua/obsidian/util.lua:525: E565: Not allowed to change text or change window
                    stack traceback:
                    [C]: in function 'nvim_buf_set_lines'
                    ...ocal/share/nvim/lazy/obsidian.nvim/lua/obsidian/util.lua:525: in function <...ocal/share/nvim/lazy/obsidian.nvim/lua/obsidian/util.lua:498>
                --]]
            -- TODO: add group properly
                -- expected `,` or ``
        })
    local mdGroup = vim.api.nvim_create_autocmd("MarkdownGroup", {})
    vim.api.nvim_create_autocmd("MarkdownGroup", {
        group = mdGroup,
        pattern = "*.md",
        callback = function()
            vim.keymap.set("n", "<leader><cr>", function()
                    return obsidian.util.smart_action()
                end,
                { buffer = true, expr = true }
            )
            vim.keymap.set("n", "<leader>ox", function()
                    return obsidian.util.toggle_checkbox()
                end,
                { buffer = true, expr = true }
            )
            --[[
            vim.keymap.set("n", "<leader>ol", function()
                    return obsidian.util.smart_action()
                end,
                { buffer = true, expr = true }
            )
            vim.keymap.set("n", "<leader>on", function()
                    return obsidian.util.smart_action()
                end,
                { buffer = true, expr = true }
            )
        --]]
        end,
    })
    end
}
