local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Add file to Harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)
-- Toggle Harpoon quick menu
vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu)

-- Harpoon 1
vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end)
-- Harpoon 2
vim.keymap.set("n", "<leader>hr", function() ui.nav_file(2) end)
-- Harpoon 3
vim.keymap.set("n", "<leader>hp", function() ui.nav_file(3) end)
-- Harpoon 4
vim.keymap.set("n", "<leader>hn", function() ui.nav_file(4) end)
