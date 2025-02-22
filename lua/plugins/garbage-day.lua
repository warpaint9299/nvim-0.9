return {
	{
		"MaximilianLloyd/lazy-reload.nvim",
		opts = {
			command_name = "ReloadPlugin",
		},
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			require("garbage-day").setup({
				aggressive_mode = true,
				notifications = true,
				excluded_lsp_clients = { "null-ls" },
				retries = 4,
			})
			local opt = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>ce", ":lua require('garbage-day.utils').stop_lsp()<CR>", opt)
			vim.api.nvim_set_keymap("n", "<leader>cs", ":lua require('garbage-day.utils').start_lsp()<CR>", opt)
		end,
	},
}
