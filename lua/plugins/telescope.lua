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
			vim.api.nvim_set_keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opt)
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
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup({
				history = 1000,
				enable_persistent_history = false,
				length_limit = 1048576,
				continuous_sync = false,
				db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
				filter = nil,
				preview = true,
				prompt = nil,
				default_register = '"',
				default_register_macros = "q",
				enable_macro_history = true,
				content_spec_column = false,
				disable_keycodes_parsing = false,
			})
			vim.api.nvim_set_keymap("n", '""', ":Telescope neoclip<CR>", { noremap = true, silent = true })
		end,
	},
}
