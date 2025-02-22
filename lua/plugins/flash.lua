return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				",",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({})
				end,
				desc = "Flash Jump search",
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
			require("flash").setup({
				label = {
					-- allow uppercase labels
					uppercase = true,
					-- add any labels with the correct case here, that you want to exclude
					exclude = "",
					-- add a label for the first match in the current window.
					-- you can always jump to the first match with `<CR>`
					current = true,
					-- show the label after the match
					after = false, ---@type boolean|number[]
					-- show the label before the match
					before = true, ---@type boolean|number[]
					-- position of the label extmark
					style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
					-- flash tries to re-use labels that were already assigned to a position,
					-- when typing more characters. By default only lower-case labels are re-used.
					reuse = "lowercase", ---@type "lowercase" | "all" | "none"
					-- for the current window, label targets closer to the cursor first
					distance = true,
					-- minimum pattern length to show labels
					-- Ignored for custom labelers.
					min_pattern_length = 0,
					-- Enable this to use rainbow colors to highlight labels
					-- Can be useful for visualizing Treesitter ranges.
					rainbow = {
						enabled = false,
						-- number between 1 and 9
						shade = 5,
					},
					-- With `format`, you can change how the label is rendered.
					-- Should return a list of `[text, highlight]` tuples.
					---@class Flash.Format
					---@field state Flash.State
					---@field match Flash.Match
					---@field hl_group string
					---@field after boolean
					---@type fun(opts:Flash.Format): string[][]
					format = function(opts)
						return { { opts.match.label, opts.hl_group } }
					end,
				},
			})
		end,
	},
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
}
