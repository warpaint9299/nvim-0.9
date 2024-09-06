return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "letter",
			config = {
				header = {
					"     .-') _   ('-.                     (`-.           _   .-')    ",
					"    ( OO ) )_(  OO)                  _(OO  )_        ( '.( OO )_  ",
					",--./ ,--,'(,------. .-'),-----. ,--(_/   ,. \\ ,-.-') ,--.   ,--.)",
					"|   \\ |  |\\ |  .---'( OO'  .-.  '\\   \\   /(__/ |  |OO)|   `.'   | ",
					"|    \\|  | )|  |    /   |  | |  | \\   \\ /   /  |  |  \\|         | ",
					"|  .     |/(|  '--. \\_) |  |\\|  |  \\   '   /,  |  |(_/|  |'.'|  | ",
					"|  |\\    |  |  .--'   \\ |  | |  |   \\     /__),|  |_.'|  |   |  | ",
					"|  | \\   |  |  `---.   `'  '-'  '    \\   /   (_|  |   |  |   |  | ",
					"`--'  `--'  `------'     `-----'      `-'      `--'   `--'   `--' ",
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
