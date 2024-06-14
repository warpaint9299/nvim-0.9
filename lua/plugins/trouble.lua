return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	event = "LspAttach",
	config = function()
		require("trouble").setup({})
	end,
}
