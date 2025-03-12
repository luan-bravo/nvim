require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

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
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- Existing content of init.lua
require("theprimeagen.set")
require("theprimeagen.remap")
require("theprimeagen.lazy_init")
-- ... (rest of your existing code)

----------------------------------
-- luan-brav0 configs from here on
----------------------------------

-- Clipboard configuration based on environment
local function setup_clipboard()
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
end
setup_clipboard()


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
-- Really ensure bash like highlighting
local zshgroup = augroup("FiletypeZsh", { clear = true })
autocmd("FileType", {
  group = zshgroup,
  pattern = "zsh",
  callback = function()
    vim.bo.syntax = "bash"
  end,
})
-- vim.cmd [[
--   autocmd FileType zsh setlocal syntax=bash
-- ]]
