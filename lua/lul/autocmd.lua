local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

local lul = augroup('lul', {})
autocmd('LspAttach', {
    group = lul,
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = e.buf, desc = "Go to definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = e.buf, desc = "Hovering definition buf" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = e.buf, desc = "View workspace symbols" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = e.buf, desc = "View code actions" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = e.buf, desc = "View references" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = e.buf, desc = "Rename" })
        vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, { buffer = e.buf, desc = "Signature help (?)" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = e.buf, desc = "Open floating diagnostic" })
        vim.keymap.set("n",  "[d", function() vim.diagnostic.goto_next() end, { buffer = e.buf, desc = "Next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = e.buf, desc = "Previous diagnostic" })
    end
})

-- Redo (go down undotree)
autocmd({ "BufEnter", "BufNewFile" }, {
    group = lul,
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" then
            vim.keymap.set("n", "U", "<C-R>", { noremap = true, buffer = true, desc = "Redo" })
        end
    end,
})

-- vim.filetype.add({
--     extension = {
--         zsh = "bash",
--     },
-- })

autocmd('FileType', {
    pattern = 'netrw',
    callback = function()
        -- toggle opening file from netrw in current or split buffer if netrw full is full screen
        if vim.fn.winnr('$') == 1 then
            vim.g.netrw_browse_split = 0
        else
            vim.g.netrw_browse_split = 4
        end
    end,
})

augroup("SpellOff", { clear = true })
autocmd("BufEnter", {
    group = "SpellOff",
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" then
            vim.opt_local.spell = true
        else
            vim.opt_local.spell = false
        end
    end,
})
autocmd("TermOpen", {
    group = "SpellOff",
    pattern = "*",
    callback = function()
        vim.opt_local.spell = false
    end
})

-- This snippet can be added to your ~/.config/nvim/init.lua
-- It optimizes the Neovim experience for hosting a terminal shell.

-- Create a dedicated augroup for terminal settings
local term_group = vim.api.nvim_create_augroup('TerminalCustomizations', { clear = true })

-- Autocommand to run when a terminal buffer is opened
vim.api.nvim_create_autocmd('TermOpen', {
    group = term_group,
    pattern = '*',
    callback = function()
        -- Enter insert mode automatically for a shell-like experience
        vim.cmd('startinsert')

        -- Set buffer-local options for a cleaner look
        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.wo.signcolumn = 'no'

        -- Optional: Uncomment the line below to hide the statusline in terminal buffers
        -- vim.opt_local.laststatus = 0
    end,
})

-- Autocommand to quit Neovim if the last window is a terminal that gets closed
vim.api.nvim_create_autocmd('TermClose', {
    group = term_group,
    pattern = '*',
    callback = function()
        -- Check if this is the last buffer
        local bufnrs = vim.api.nvim_list_bufs()
        local is_last_buffer = #bufnrs == 1

        if is_last_buffer then
            -- If it's the last buffer, quit Neovim
            vim.cmd('quitall!')
        end
    end,
})
