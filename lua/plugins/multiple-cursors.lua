return {
	"brenton-leighton/multiple-cursors.nvim",
	version = "*", -- Use the latest tagged version
	event = "VeryLazy",
	opts = {
		custom_key_maps = {
			{
				"n",
				"<Leader>|",
				function()
					require("multiple-cursors").align()
				end,
			},
		},
	},
	keys = {
		{
			"<C-RightMouse>",
			"<Cmd>MultipleCursorsMouseAddDelete<CR>",
			mode = { "n", "i" },
			desc = "Add or remove cursor",
		},
	},
}
