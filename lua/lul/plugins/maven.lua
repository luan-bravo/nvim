return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        local sm_ok, sm = pcall(require, "supermaven-nvim")
        if not sm_ok then return end
        sm.setup({
                -- make maven only suggest when asked
            keymaps = {
                accept_suggestion = "<Tab>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-j>",
            },


            -- ignore_filetypes = { cpp = true }, -- or { "cpp", }
            color = {
                suggestion_color = "#b16286",
                cterm = 244,
            },
            log_level = "info",
            disable_inline_completion = false,
            disable_keymaps = false,
            -- Condition to check for stopping supermaven, `true` to stop
            condition = function()
                return true
            end
        })
    end
}
