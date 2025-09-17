------------------
-- Basics/Moves --
------------------
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line w/o moving cursor" })

-- vim.keymap.set({ "n","i","v" }, "<C-d>", "<C-d>zz")
-- vim.keymap.set({ "n","i","v" }, "<C-u>", "<C-u>zz")
-- vim.keymap.set({ "n","i","v" }, "<PageUp>", "<PageUp>zz")
-- vim.keymap.set({ "n","i","v" }, "<PageDown>", "<PageDown>zz")

-- vim.keymap.set({ "n","v" }, "n", "nzzzv")
-- vim.keymap.set({ "n","v" }, "N", "Nzzzv")
-- vim.keymap.set({ "n","v" }, "{", function () vim.cmd("normal! {zz") end)
-- vim.keymap.set({ "n","v" }, "}", function () vim.cmd("normal! }zz") end)

-- This is going to get me canceled
vim.keymap.set({ "n","i","v" }, "<C-c>", "<Esc>", { desc = "Escape" })

vim.keymap.set({ "n","v" }, "Q", "<nop>")

-- TODO: Fix keyboard config with ZSH and whatever else I'll be using to fix these key maps
-- vim.keymap.set("i", "<S-BS>", "<C-w>")
-- vim.keymap.set("i", "<S-Del>", "<C-o>dw")

vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { desc = "Delete next word" })

vim.keymap.set("n", "<S-F10>", "z=", { desc = "Correct spelling alias" })

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, desc = "Escape terminal mode" })
