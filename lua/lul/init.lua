local function safe_require(module)
    local ok, _ = pcall(require, module)
    if not ok then
        vim.notify("Failed to require '" .. module .. "'", vim.log.levels.ERROR)
    end
end

safe_require("lul.set")
safe_require("lul.remap")
safe_require("lul.lazy")
safe_require("lul.functions")
safe_require("lul.autocmd")
safe_require("lul.clipboard")


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
