local keymaps = {
	"basics_and_moves",
	"great_yet_simple",
	"files_and_buffers",
	"functions",
	"formatting",
	"substitute",
	"surround",
	"misc",
	"clipboard",
}

for _, m in ipairs(keymaps) do
	local mod_path = "lul.keymaps." .. m

	local ok, _mod = pcall(require, mod_path)

	if not ok then
		vim.notify("Failed to require '" .. mod_path .. "'", vim.log.levels.ERROR)
	end
end
