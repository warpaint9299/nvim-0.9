local plugins = {}

function plugins.setup()
	return require("lazy").setup({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
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
		"vim-airline/vim-airline",
		"vim-airline/vim-airline-themes",
		{
			"Wansmer/symbol-usage.nvim",
			event = "LspAttach", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
		},
		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
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
		{
			"ellisonleao/gruvbox.nvim",
			lazy = false,
			priority = 1000,
		},
	})
end

function plugins.configure()
	return {
		require("masonSettings"),
		require("masonLSPSettings"),
		require("nvimtreeSettings"),
		require("nvimcmpSettings"),
		require("colorizerSettings"),
		require("luaSnipSettings"),
		require("dropbarSettings"),
		require("marksSettings"),
		require("scrollbarSettings"),
		require("symbolsOutlineSettings"),
		require("lspSignatureSettings"),
		require("autoFormatterSettings"),
		require("fzfLuaSettings"),
		require("symbolUsageSettings"),
	}
end

return plugins
