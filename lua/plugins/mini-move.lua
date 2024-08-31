return {
	{
		"echasnovski/mini.move",
		version = "*",
		config = function()
			require("mini.move").setup(
				-- No need to copy this inside `setup()`. Will be used automatically.
				{
					-- Module mappings. Use `''` (empty string) to disable one.
					mappings = {
						-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
						left = "<C-h>",
						right = "<C-l>",
						down = "<C-j>",
						up = "<C-k>",

						-- Move current line in Normal mode
						line_left = "<C-h>",
						line_right = "<C-l>",
						line_down = "<C-j>",
						line_up = "<C-k>",
					},

					-- Options which control moving behavior
					options = {
						-- Automatically reindent selection during linewise vertical move
						reindent_linewise = true,
					},
				}
			)
		end,
	},
	{
		"terryma/vim-multiple-cursors",
		config = function()
			vim.cmd([[
				let g:multi_cursor_use_default_mapping   = 0
				" Default mapping
				let g:multi_cursor_start_word_key        = '<C-n>'
				let g:multi_cursor_select_all_word_key   = '<C-m>'
				let g:multi_cursor_start_key             = 'g<C-n>'
				let g:multi_cursor_select_all_key        = 'g<C-m>'
				let g:multi_cursor_next_key              = '<C-n>'
				let g:multi_cursor_prev_key              = '<C-p>'
				let g:multi_cursor_skip_key              = '<C-x>'
				let g:multi_cursor_quit_key              = '<Esc>'
			]])
		end,
	},
}
