-- Embed nvim into Firefox and Chrormium textboxes

return {
	"glacambre/firenvim",
	build = ":call firenvim#install(0)",
	-- vim.pack.add({{
	-- 	src = 'https://github.com/glacambre/firenvim',
	-- 	data = {
	-- 		build = ":call firenvim#install(0)"
	-- 	}
	-- }})
	config = function()
		vim.g.firenvim_config = {
			globalSettings = {
				alt = "all"
			},
			localSettings = {
				[".*"] = {
					priority = 0,
					takeover = "never", -- ["never", "always"]
					selector = "textarea:not([readonly], [aria-readonly]), div[role=\"textbox\"]",
					cmdline  = "neovim", -- "Choosing `none` does not make sense unless you have alternative way to display the command line such as [noice.nvim](https://github.com/folke/noice.nvim)."
					content  = "text",
					-- selector = "textarea",
					filename = vim.fn.getenv("HOME").."/.cache/tmp/nvim/firenvim/{hostname}_{pathname%10}.{extension}"
				},
				["https://web\\.whatsapp\\.com/?.*"] = {
					priority = 1,
					takeover = "never",
				}
			}
		}

		local frnv_g = Group("Firenvim", {})
		Autocmd("UIEnter", {
			group = frnv_g,
			callback = function()
				local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
				if client ~= nil and client.name == "Firenvim" then
					-- No extra columns or lines
					vim.opt.number = false
					vim.opt.rnu = false
					vim.opt.signcolumn = "no"
					vim.opt.colorcolumn = ""

					vim.opt.showtabline = 0
					vim.opt.laststatus = 0
					vim.opt.cmdheight = 0
					vim.opt.showmode = false
					vim.opt.showcmd = false
					vim.opt.showcmdloc = "last"

					local firenvim_tab = 2
					vim.opt.tabstop = firenvim_tab
					vim.opt.softtabstop = firenvim_tab
					vim.opt.shiftwidth = firenvim_tab
					vim.opt.expandtab = true

					-- Wrap text
					vim.opt.wrap = true
					vim.opt.linebreak = true
					vim.opt.showbreak = nil

					-- Reset scroll off
					vim.opt.scrolloff = -1

					-- Highlight like markdown
					vim.opt.filetype = "markdown" -- is this the right/best way?

					-- EN-US and PT-BR spell checking
					vim.opt.spell = true
				end
			end
		})
	end
}
