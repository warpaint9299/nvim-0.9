return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lspconfig").clangd.setup({})
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").vimls.setup({})
		require("lspconfig").bashls.setup({})
		require("lspconfig").jdtls.setup({})
		require("lspconfig").pyright.setup({})
		require("lspconfig").texlab.setup({})
		require("lspconfig").kotlin_language_server.setup({})
		require("lspconfig").rust_analyzer.setup({})
	end,
}
