local plugins = {}

function plugins.setup()
	return require("lazy").setup({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"kyazdani42/nvim-web-devicons",
		"NTBBloodbath/galaxyline.nvim",
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'NvChad/nvim-colorizer.lua',
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.2.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp"
		},
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				-- add any options here
			},
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
			config = function()
				require("auto-format").setup()
			end
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
		require("autoformatSettings"),
		require("colorizerSettings"),
		require("telescopeSettings"),
		require("noiceSettings"),
		require("luasnipSettings"),
	}
end

return plugins;
