return {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    config = function()
        -- This module contains a number of default definitions
        local rd_ok, rainbow_delimiters = pcall(require,"rainbow-delimiters")
        if not rd_ok then return end

        ---@type rainbow_delimiters.config
        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            priority = {
                [''] = 110,
                lua = 210,
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
    end
}
