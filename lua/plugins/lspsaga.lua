return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			lightbulb = {
				enable = true,
				sign = true,
				virtual_text = false,
				debounce = 10,
				sign_priority = 40,
			},
			ui = {
				winblend = 10,
				border = "rounded",
				code_action = "💡",
				colors = {
					normal_bg = "NONE",
				},
			},
			beacon = {
				enable = false,
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
}
