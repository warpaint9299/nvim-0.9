return {
	{
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
					keymaps = {
						insert = "<C-g>s",
						insert_line = "<C-g>S",
						normal = "ys",
						normal_cur = "yss",
						normal_line = "yS",
						normal_cur_line = "ySS",
						visual = "S",
						visual_line = "gS",
						delete = "ds",
						change = "cs",
						change_line = "cS",
					},
				})
			end,
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = { forward = true, wrap = false, multi_window = false },
					})
				end,
				desc = "Flash Forward search only",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = { forward = false, wrap = false, multi_window = false },
					})
				end,
				desc = "Flash Backward search only",
			},
			{
				"ga",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"\\",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = { mode = "search", max_length = 0 },
						label = { after = { 0, 0 } },
						pattern = "^",
					})
				end,
				desc = "Flash Jump to a line",
			},
			{
				"#",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						pattern = vim.fn.expand("<cword>"),
					})
				end,
				desc = "Flash Initialize It with the word under the cursor",
			},
		},
		config = function()
			require("flash").setup({})
		end,
	},
}
