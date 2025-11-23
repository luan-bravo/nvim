------------------
-- Basics/Moves --
------------------
-- <nop>
vim.keymap.set({"n","v"}, "Q", "<nop>", { desc = "nop", remap = true})

-- Escape w/ <C-c>
vim.keymap.set({"n","i","v"}, "<C-c>", "<Esc>", { desc = "<Esc>" })
vim.keymap.set({"n","i","v"}, "<C-c>", "<Esc>", { desc = "<Esc>" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line w/o moving cursor" })

vim.keymap.set("i", "<C-BS>", "<C-H>",    { desc = "Delete previous word" })
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { desc = "Delete next word" })

-- in/around string aliases
vim.keymap.set("v", "aq",  "a\"",  { desc = "\" string" })
vim.keymap.set("n", "yaq", "ya\"", { desc = "yank \" string" })
vim.keymap.set("n", "caq", "ca\"", { desc = "cut \" string" })
vim.keymap.set("n", "daq", "da\"", { desc = "delete \" string" })

vim.keymap.set("v", "iq",  "i\"",  { desc = "inner \" string" })
vim.keymap.set("n", "yiq", "yi\"", { desc = "yank inner \" string" })
vim.keymap.set("n", "ciq", "ci\"", { desc = "cut inner \" string" })
vim.keymap.set("n", "diq", "di\"", { desc = "delete inner \" string" })

-- Search Highlighting
vim.keymap.set("v", "<leader>/", "mzy/<C-r>\"<cr>N", { desc = "Highlight visual selection" })
vim.keymap.set("n", "<leader>/", ":noh<cr>",         { desc = "Clear highlighting" })

-- Go to 'EOL'
vim.keymap.set("v", "$", "$h", { desc = "$ until \\n non-inclusive", remap = true })
vim.keymap.set("v", "v", "$", { desc = "$ until \\n non-inclusive", remap = true})
vim.keymap.set("v", "g$", "$", { desc = "$ until \\n non-inclusive", remap = true })



