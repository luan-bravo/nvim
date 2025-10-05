------------------
-- Basics/Moves --
------------------
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line w/o moving cursor" })
-- TODO: To Fix: Both working fine in ZSH, but only C-Del working in nvim
-- Verbose insert from ZSH: C-BS -> <C-H> BUT BS -> <BS>
--[[
	*i_CTRL-H* *i_<BS>* *i_BS*
	<BS> or CTRL-H	Delete the character before the cursor (see |i_backspacing|
	about joining lines).
--]]
vim.keymap.set("i", "<C-BS>", "<C-H>",
	{ desc = "Delete previous word" })
vim.keymap.set("i", "<C-Del>", "<C-o>dw",
	{ desc = "Delete next word" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>",
	{ desc = "Escape terminal mode", noremap = true })

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


vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { desc = "Delete next word" })

vim.keymap.set("n", "<S-F10>", "z=", { desc = "Correct spelling alias" })

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, desc = "Escape terminal mode" })


vim.keymap.set("n", "diq", "di\"", { desc = "Select inside double quotes - 'di\"' alias" })
vim.keymap.set("n", "daq", "da\"", { desc = "Select around double quotes - 'da\"' alias" })

vim.keymap.set("n", "ciq", "ci\"", { desc = "Select inside double quotes - 'ci\"' alias" })
vim.keymap.set("n", "caq", "ca\"", { desc = "Select around double quotes - 'ca\"' alias" })

vim.keymap.set("n", "yiq", "yi\"", { desc = "Select inside double quotes - 'yi\"' alias" })
vim.keymap.set("n", "yaq", "ya\"", { desc = "Select around double quotes - 'ya\"' alias" })
-- TODO: Create easierInsideArround() in surround.lua
vim.keymap.set("v", "iq", "i\"",
	{ desc = "Select inside '\"\"'" })
vim.keymap.set("v", "aq", "a\"",
	{ desc = "Select around '\"\"'" })
