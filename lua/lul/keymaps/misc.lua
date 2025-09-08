-- Source
vim.keymap.set("n", "<leader><leader><leader>", function() vim.cmd("so") end, { desc = "Source nvim config" })


-- Tmux Sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux neww sessionizer" })


-- LSP Restart
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>", { desc = "LSP Restart" })


-- Make it rain, baby
vim.keymap.set("n", "<leader><leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it Rain" });


-- Vim with Me
vim.keymap.set("n", "<leader>vwm", function()
    local vwm_ok, vwm = pcall(require, "vim-with-me")
    if not vwm_ok then return end
    vwm.StartVimWithMe()
end, {desc = "VimWithMe start"})
 
vim.keymap.set("n", "<leader>svwm", function()
    local vwm_ok, vwm = pcall(require, "vim-with-me")
    if not vwm_ok then return end
    vwm.StopVimWithMe()
end, {desc = "VimWithMe stop"})
