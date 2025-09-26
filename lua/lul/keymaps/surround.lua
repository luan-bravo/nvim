-------------------
-- Surround Text --
-------------------
-- first second third
vim.keymap.set({ "n","v" }, "s", "<nop>")
vim.keymap.set({ "n","v" }, "S", "<nop>")

local surrounding_pairs = {
	{"\"\"", "\""},
	{"\"\"", "q"},
	{"''", "'"},
	{"''", "Q"},
	{"``", "`"},
	{"``", "c"},

	{"<>", "<"},
	{"<>", "t"},
	{"</>", ">"},
	{"</>", "T"},

	{"{}", "{"},
	{"{  }", "<space>{"},

	{"()", "("},

	{"[]", "["},
	{"[[]]", "l"},
	{"[  ]", "<space>["},
	{"[[  ]]", "<space>l"},
	{"[[  ]];", "<space>L"},

	{"**", "*"},
	{"__", "_"},
	{"__", "i"},
	{"****", "b"},
	{"_****_", "I"},
	{"_****_", "B"},
	{"~~", "~"}
}

for _, p in ipairs(pairs) do
	local pair = p[1]
	local trigger = p[2]
	local padding = p[3]
	-- print(pair .. " " .. trigger .. " ")


	if (trigger == "") then trigger = pair end

	-- Padding for inserting to be surrounded text centralized to the surrounding text
	local pad = ""
	if (padding == nil) then
		if (#pair % 2 == 0) then
			padding = (#pair/2)-1
		else
			padding = (#pair/2)
		end
	end
	pad = string.rep("h", padding)

	-- print(pair .. " " .. trigger .. " " .. pad)


	local desc = "Surround w/ " .. pair

	local vPattern = "c" .. pair .. "<Esc>" .. pad .. "P"

	local nwPattern = "viwc" .. pair .. "<Esc>" .. pad .. "P"
	local nWPattern = "viWc" .. pair .. "<Esc>" .. pad .. "P"


	vim.keymap.set("v", "s" .. trigger, vPattern, { desc = desc})
	vim.keymap.set("v", "S" .. trigger, vPattern, { desc = desc})

	vim.keymap.set("n", "s" .. trigger, nwPattern, { desc = desc})
	vim.keymap.set("n", "S" .. trigger, nWPattern, { desc = desc})
end
