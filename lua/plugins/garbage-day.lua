return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opt = {
		aggressive_mode = true,
		notifications = true,
		excluded_lsp_clients = { "null-ls" },
		retries = 4,
	},
}
