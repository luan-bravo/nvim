function Safe_require(module)
    local ok, _ = pcall(require, module)
    if not ok then
        vim.notify("Failed to require '" .. module .. "'", vim.log.levels.ERROR)
    end
end

Safe_require("lul.set")
Safe_require("lul.keymaps.init")
Safe_require("lul.lazy")
Safe_require("lul.functions")
Safe_require("lul.autocmd")
Safe_require("lul.clipboard")


function R(name)
    local r_ok, reload = pcall(require, "plenary.reload")
    if not r_ok then return end
    reload.reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})
