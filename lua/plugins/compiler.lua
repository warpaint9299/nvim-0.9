return { -- This plugin
	"Zeioth/compiler.nvim",
	cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
	opts = {},
	-- Open compiler
	vim.api.nvim_set_keymap("n", "<F6>", ":CompilerOpen<CR>", { noremap = true, silent = true }),

	-- Stop compiler option
	vim.api.nvim_set_keymap("n", "<F8>", ":CompilerStop<CR>", { noremap = true, silent = true }),

	-- Redo last selected option
	vim.api.nvim_set_keymap(
		"n",
		"<leader><F6>",
		":CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
			.. ":CompilerRedo<cr>",
		{ noremap = true, silent = true }
	),

	-- Toggle compiler results
	vim.api.nvim_set_keymap("n", "<leader><F7>", ":CompilerToggleResults<cr>", { noremap = true, silent = true }),
}
