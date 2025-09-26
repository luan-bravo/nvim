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

-- TODO: Re-evaluate if it it would be better to just `ls ./keymaps` (how to?)
-- for _, file in ipairs(ls) then
-- 	local extention = ".lua"
-- 	local filename = file[1:-#extention]
-- 	if filename == extentiona then
-- 		SafeRequire("lul.keymaps." .. file_title)
-- 	end
-- end
--

for _, k in ipairs(keymaps) do
	SafeRequire("lul.keymaps." .. k)
end
