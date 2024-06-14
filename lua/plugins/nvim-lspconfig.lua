return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lspconfig").clangd.setup({})
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").vimls.setup({})
		require("lspconfig").jdtls.setup({})
	end,
}
