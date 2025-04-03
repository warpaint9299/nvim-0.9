return {
	{
		"anuvyklack/windows.nvim",
		priority = 1000,
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			require("windows").setup({
				autowidth = {
					enable = false,
					winwidth = 7,
					filetype = {
						help = 2,
					},
				},
				ignore = {
					buftype = { "quickfix" },
					filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "snacks_layout_box" },
				},
				animation = {
					enable = true,
					duration = 300,
					fps = 30,
					easing = "in_out_sine",
				},
			})
			local function cmd(command)
				return table.concat({ "<Cmd>", command, "<CR>" })
			end
			vim.keymap.set("n", "<C-w>z", cmd("WindowsMaximize"))
			vim.keymap.set("n", "<C-w>_", cmd("WindowsMaximizeVertically"))
			vim.keymap.set("n", "<C-w>|", cmd("WindowsMaximizeHorizontally"))
			vim.keymap.set("n", "<C-w>=", cmd("WindowsEqualize"))
		end,
	},
	{
		"oberblastmeister/zoom.nvim",
		config = function()
			vim.keymap.set("n", "<C-w>Z", ":Zoom<CR>", { silent = true })
		end,
	},
}
