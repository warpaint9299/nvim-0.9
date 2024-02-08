local plugins = {}
function plugins.setup ()
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
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'NvChad/nvim-colorizer.lua',
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
		require("indentSettings"),
		require("nvimcmpSettings"),
		require("colorizerSettings"),
	}
end

return plugins;
