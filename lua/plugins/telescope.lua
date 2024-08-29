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
		vim.api.nvim_set_keymap("n", "<leader>f;", ":Telescope builtin<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", opt)
	end,
}
