function SafeRequire(module)
	local ok, m = pcall(require, module)
	if not ok then
		vim.notify(
			"Failed to require '" .. module .. "'" .. "\n\n" .. m,
			vim.log.levels.ERROR)
		return
	end
	return m
end

SafeRequire("lul.options")
SafeRequire("lul.autocmd")
SafeRequire("lul.functions")
SafeRequire("lul.keymaps.keymaps")
SafeRequire("lul.lazy")
SafeRequire("lul.clipboard")



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
