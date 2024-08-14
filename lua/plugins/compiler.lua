return { -- This plugin
	"Zeioth/compiler.nvim",
	cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
	opts = {},
	-- Open compiler
	vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true }),

	-- Redo last selected option
	vim.api.nvim_set_keymap(
		"n",
		"<leader><F6>",
		"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
			.. "<cmd>CompilerRedo<cr>",
		{ noremap = true, silent = true }
	),

	-- Toggle compiler results
	vim.api.nvim_set_keymap("n", "<leader><F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true }),
}, { -- The task runner we use
	"stevearc/overseer.nvim",
	commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
	cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	config = function()
		require("overseer").setup({
			task_list = {
				direction = "bottom",
				min_height = 30,
				max_height = 30,
			},
		})
	end,
}
