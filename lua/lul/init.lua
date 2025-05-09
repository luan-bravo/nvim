local set_ok, _ = pcall(require, "lul.set")
if not set_ok then print("[nvim]: Failed to require 'lul.set'") end
local remap_ok, _ = pcall(require, "lul.remap")
if not remap_ok then print("[nvim]: Failed to require 'lul.remap'") end
local lazy_ok, _ = pcall(require, "lul.lazy")
if not lazy_ok then print("[nvim]: Failed to require 'lul.lazy'") end
local functions_ok, _ = pcall(require, "lul.functions")
if not functions_ok then print("[nvim]: Failed to require 'lul.functions'") end
local autocmd_ok, _ = pcall(require, "lul.autocmd")
if not autocmd_ok then print("[nvim]: Failed to require 'lul.autocmd'") end
local clipboard_ok, _ = pcall(require, "lul.clipboard")
if not clipboard_ok then print("[nvim]: Failed to require 'lul.clipboard'") end

-- (?)
function R(name)
    local r_status_ok, reload = pcall(require, "plenary.reload")
    if not r_status_ok then return end
    reload.reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})
