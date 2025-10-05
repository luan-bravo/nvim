------------------
-- Basics/Moves --
------------------
vim.keymap.set("n", "J", "mzJ`z",
	{ desc = "Join line w/o moving cursor" })

vim.keymap.set({ "n","i","v" }, "<C-c>", "<Esc>",
	{ desc = "Escape" })

vim.keymap.set({ "n","v" }, "Q", "<nop>",
	{ desc = "<NOP> repeat last recorded register default key"})

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

-- TODO: Create easierInsideArround() in surround.lua
vim.keymap.set("v", "iq", "i\"",
	{ desc = "Select inside '\"\"'" })
vim.keymap.set("v", "aq", "a\"",
	{ desc = "Select around '\"\"'" })
vim.keymap.set("n", "diq", "di\"",
	{ desc = "Select inside '\"\"'" })
vim.keymap.set("n", "daq", "da\"",
	{ desc = "Select around '\"\"'" })
vim.keymap.set("n", "ciq", "ci\"",
	{ desc = "Select inside '\"\"'" })
vim.keymap.set("n", "caq", "ca\"",
	{ desc = "Select around '\"\"'" })
vim.keymap.set("n", "yiq", "yi\"",
	{ desc = "Select inside '\"\"'" })
vim.keymap.set("n", "yaq", "ya\"",
	{ desc = "Select around '\"\"'" })
