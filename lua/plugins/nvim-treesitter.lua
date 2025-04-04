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
			require("nvim-treesitter.configs").setup({})
		end,
	},
}
