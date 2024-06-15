return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opt = {
		aggressive_mode = true,
		notifications = true,
		retries = 4,
	},
}
