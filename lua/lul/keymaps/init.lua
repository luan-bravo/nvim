local function Safe_require(module)
    local ok, _ = pcall(require, module)
    if not ok then
        vim.notify("Failed to require '" .. module .. "'", vim.log.levels.ERROR)
    end
end

local path = vim.fn.stdpath("config") .. 'lua/keymaps'



Safe_require("lul.keymaps.basics_and_moves")
Safe_require("lul.keymaps.clipboard")
Safe_require("lul.keymaps.files_and_buffers")
Safe_require("lul.keymaps.formatting")
Safe_require("lul.keymaps.functions")
Safe_require("lul.keymaps.great_yet_simple")
Safe_require("lul.keymaps.specific")
Safe_require("lul.keymaps.substitute")
Safe_require("lul.keymaps.surround")
