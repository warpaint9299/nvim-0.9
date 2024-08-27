return {
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
		vim.api.nvim_set_keymap("n", "<leader>;;", ":Telescope builtin<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>;/", ":Telescope current_buffer_fuzzy_find<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>;d", ":Telescope diagnostics<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>;b", ":Telescope buffers<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>;g", ":Telescope live_grep<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>;f", ":Telescope find_files<CR>", opt)
	end,
}
