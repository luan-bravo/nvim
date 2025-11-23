return {
	"rmagatti/auto-session",
	config = function()
		local ause = PRequire("auto-session")
			-- vanilla option?
		if not ause then return end

		ause.setup({})
		-- {
		-- 	log_level = "error",
		-- 	auto_session_enable_last_session = false,
		-- 	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
		-- 	auto_session_enabled = true,
		-- 	auto_save_enabled = true,
		-- 	auto_restore_enabled = true,
		-- 	auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
		-- }

		vim.keymap.set("n", "<leader>.sr", "<cmd>SessionRestore<CR>",
						{ desc = "Restore session" })
		vim.keymap.set("n", "<leader>.ss", "<cmd>SessionSave<CR>",
						{ desc = "Save session" })
	end,
}
