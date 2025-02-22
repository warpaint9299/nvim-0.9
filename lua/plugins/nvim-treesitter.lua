return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"asm",
					"bash",
					"c",
					"cpp",
					"css",
					"diff",
					"dockerfile",
					"fish",
					"go",
					"groovy",
					"haskell",
					"html",
					"htmldjango",
					"http",
					"ini",
					"java",
					"json",
					"javascript",
					"kotlin",
					"lua",
					"llvm",
					"make",
					"latex",
					"markdown",
					"markdown_inline",
					"nginx",
					"perl",
					"php",
					"powershell",
					"python",
					"rust",
					"ruby",
					"sql",
					"scss",
					"toml",
					"typescript",
					"tsx",
					"vim",
					"vimdoc",
					"vue",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]["] = "@function.outer",
							["]{"] = "@class.outer",
						},
						goto_next_end = {
							["]]"] = "@function.outer",
							["]}"] = "@class.outer",
						},
						goto_previous_start = {
							["[["] = "@functoin.outer",
							["[{"] = "@class.outer",
						},
						goto_previous_end = {
							["[]"] = "@functoin.outer",
							["[}"] = "@class.outer",
						},
						goto_next = {
							["]d"] = "@conditional.outer",
						},
						goto_previous = {
							["[d"] = "@conditional.outer",
						},
					},
				},
			})
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			vim.keymap.set({ "n", "x", "o" }, "<Leader>]", ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ "n", "x", "o" }, "<Leader>[", ts_repeat_move.repeat_last_move_previous)
		end,
	},
}
