return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = {
					"	███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"	████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"	██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"	██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"	██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"	╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
				},
				packages = { enable = false },
				project = {
					enable = true,
					limit = 7,
				},
				mru = {
					limit = 10,
					cwd_only = false,
				},
				footer = {},
				shortcut = {
					{
						icon = " ",
						desc = "Projects",
						action = "Telescope neovim-project discover",
						key = "o",
					},
					{
						icon = " ",
						desc = "Files",
						action = "Telescope find_files",
						key = "f",
					},
				},
			},
		})
	end,
}
