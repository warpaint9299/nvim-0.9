local plugins = {}

function plugins.setup()
	return require("lazy").setup({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"NTBBloodbath/galaxyline.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"NvChad/nvim-colorizer.lua",
		"chentoast/marks.nvim",
		"gennaro-tedesco/nvim-peekup",
		"petertriho/nvim-scrollbar",
		"simrat39/symbols-outline.nvim",
		"mhartington/formatter.nvim",
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
			-- use opts = {} for passing setup options
			-- this is equalent to setup({}) function
		},
		{
			"utilyre/barbecue.nvim",
			name = "barbecue",
			dependencies = {
				"SmiteshP/nvim-navic",
				"nvim-tree/nvim-web-devicons",
			},
			version = "v1.2.0",
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.2.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			opts = {},
		},
		{
			"akinsho/bufferline.nvim",
			lazy = false,
		},
		{
			"nvim-tree/nvim-tree.lua",
			lazy = false,
		},
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
		},
	})
end

function plugins.configure()
	return {
		require("masonSettings"),
		require("masonLSPSettings"),
		require("galaxylineSettings"),
		require("nvimtreeSettings"),
		require("bufferlineSettings"),
		require("nvimcmpSettings"),
		require("colorizerSettings"),
		require("luasnipSettings"),
		require("dropbarSettings"),
		require("marksSettings"),
		require("scrollbarSettings"),
		require("symbolsOutlineSettings"),
		require("lspSignatureSettings"),
		require("autoFormatterSettings"),
	}
end

return plugins
