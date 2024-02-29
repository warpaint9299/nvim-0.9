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
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true
			-- use opts = {} for passing setup options
			-- this is equalent to setup({}) function
		},
		{
			"utilyre/barbecue.nvim",
			name = "barbecue",
			dependencies = {
				"SmiteshP/nvim-navic",
				"nvim-tree/nvim-web-devicons"
			},
			version = "v1.2.0",
		},
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function() vim.fn["mkdp#util#install"]() end,
		},
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.2.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp"
		},
		{
			"folke/noice.nvim",
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			}
		},
		{
			"https://git.sr.ht/~nedia/auto-format.nvim",
			event = "BufWinEnter",
		},
		{
			'nvim-telescope/telescope.nvim',
			tag = '0.1.5',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
		{
			"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}
		},
		{
			'akinsho/bufferline.nvim',
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
	});
end

function plugins.configure()
	return {
		require("masonSettings"),
		require("masonLSPSettings"),
		require("galaxylineSettings"),
		require("nvimtreeSettings").setup(),
		require("nvimtreeSettings").generic_attr(),
		require("bufferlineSettings"),
		require("nvimcmpSettings"),
		require("colorizerSettings"),
		require("telescopeSettings"),
		require("luasnipSettings"),
		require("dropbarSettings"),
		require("marksSettings"),
		require("scrollbarSettings"),
		require("autoformatSettings"),
		--		require("noiceSettings"),
	}
end

return plugins;
