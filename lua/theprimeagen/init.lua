require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

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

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = e.buf, desc = "Go to definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = e.buf, desc = "Hovering definition buf" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = e.buf, desc = "View workspace symbols" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = e.buf, desc = "View code actions" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = e.buf, desc = "View references" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = e.buf, desc = "Rename" })
        -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = e.buf, desc = "Signature help (?)" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = e.buf, desc = "Open floating diagnostic" })
        vim.keymap.set("n",  "[d", function() vim.diagnostic.goto_next() end, { buffer = e.buf, desc = "Next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = e.buf, desc = "Previous diagnostic" })
    end
})
-- Clipboard configuration based on environment
local is_wsl = vim.fn.has("wsl") == 1 or os.getenv("WSL_DISTRO_NAME") ~= nil
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local is_linux = vim.fn.has("unix") == 1 and not (is_wsl or is_windows)
if is_wsl or is_windows then
vim.g.clipboard = {
  name = "wslclipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
    ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
  },
  cache_enabled = 0,
}
elseif is_linux then
vim.g.clipboard = {
  name = "xclip",
  copy = {
    ["+"] = "xclip -selection clipboard",
    ["*"] = "xclip -selection primary",
  },
  paste = {
    ["+"] = "xclip -selection clipboard -o",
    ["*"] = "xclip -selection primary -o",
  },
  cache_enabled = 0,
}
end


-- Redo (go down undotree)
autocmd({"BufEnter", "BufNewFile"}, {
  group = ThePrimeagenGroup, -- Reuse your existing group
  pattern = "*", -- Apply to all files
  callback = function()
    -- Only set U as redo for normal file buffers (not special ones)
    if vim.bo.buftype == "" then
      vim.keymap.set("n", "U", "<C-R>", { noremap = true, buffer = true, desc = "Redo" })
    end
  end,
})


-- Treat zsh files like bash files
vim.filetype.add({
  extension = {
    zsh = "bash",
  },
})

-- Access nvim config anywhere in a new tab
vim.api.nvim_create_user_command('Configuration', function()
    -- Create a new tab
        vim.cmd('tabnew')
        -- Change directory for the current tab to ~/.config/nvim
        vim.cmd('tcd ~/.config/nvim')
        -- Open the file explorer (using Netrw)
        vim.cmd('Explore')
    end,
{ desc = 'Open nvim config dir in a new tab with Explorer' }
)

-- Access notes dir anywhere in a new tab
vim.api.nvim_create_user_command('Notes', function()
    -- Create a new tab
        vim.cmd('tabnew')
        -- Change directory for the current tab to ~/.config/nvim
        vim.cmd('tcd ~/notes')
        -- Open the file explorer (using Netrw)
        vim.cmd('Explore')
    end,
{ desc = 'Open nvim config dir in a new tab with Explorer' }
)

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
