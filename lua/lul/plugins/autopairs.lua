return {
    "windwp/nvim-autopairs",
    config = function()

        -- Setup nvim-cmp.
        local ap_status_ok, autopairs = pcall(require, "nvim-autopairs")
        if not ap_status_ok then return end

        autopairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        })

        local cnp_status_ok, autopairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
        if not cnp_status_ok then return end
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then return end
        cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done({ map_char = { tex = "" } }))
    end
}
