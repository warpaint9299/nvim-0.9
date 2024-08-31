return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
						},
					},
				},
			})
			local opt = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>f;", ":Telescope builtin<CR>", opt)
			vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", opt)
			vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
			vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", opt)
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					enabled = true,
					default_prompt = "Input",
					trim_prompt = true,
					start_in_insert = false,
					max_width = { 140, 0.9 },
					min_width = { 20, 0.2 },
					win_options = {
						-- Disable line wrapping
						wrap = true,
						-- Indicator for when text exceeds window
						list = true,
						listchars = "precedes:…,extends:…",
						-- Increase this for more context when text scrolls off the window
						sidescrolloff = 0,
					},
					mappings = {
						n = {
							["<Esc>"] = "Close",
							["<CR>"] = "Confirm",
						},
						i = {
							["<C-c>"] = "Close",
							["<CR>"] = "Confirm",
							["<Up>"] = "HistoryPrev",
							["<Down>"] = "HistoryNext",
						},
					},
				},
			})
		end,
	},
}
