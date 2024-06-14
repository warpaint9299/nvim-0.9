return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	config = function()
		require("garbage-day").setup({})
	end,
}
