return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	priority = 1024,
	config = function()
		if vim.g.neovide then
			return
		end
		vim.api.nvim_set_hl(0, "DashboardHeader", { link = "Question" })
		-- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#FFAF00", bg = "NONE", bold = true })
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "letter",
			change_to_vcs_root = true,
			config = {
				header = {
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
				},
				shortcut = {
					{
						icon = " ",
						desc = "Edit",
						group = "DiagnosticSignWarn",
						key = "e",
						action = "enew",
					},
					{
						icon = " ",
						desc = "Open Porject",
						group = "Question",
						key = "o",
						action = "Telescope neovim-project discover",
					},
					{
						icon = "󰿅 ",
						desc = "Quit",
						group = "DiagnosticSignError",
						key = "q",
						action = "quit",
					},
				},
				packages = { enable = false }, -- show how many plugins neovim loaded
				-- limit how many projects list, action when you press key or enter it will run this action.
				-- action can be a functino type, e.g.
				-- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
				project = {
					enable = true,
					limit = 8,
					action = function(path)
						local home = os.getenv("HOME")
						vim.cmd("NeovimProjectLoad " .. path:gsub("^" .. home, "~"))
					end,
				},
				mru = {
					limit = 10,
					cwd_only = false,
				},
				footer = {}, -- footer
			},
		})
	end,
}
