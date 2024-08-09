return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lspconfig").bashls.setup({})
		require("lspconfig").clangd.setup({})
		require("lspconfig").cssls.setup({})
		require("lspconfig").html.setup({})
		require("lspconfig").jdtls.setup({})
		require("lspconfig").kotlin_language_server.setup({})
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").marksman.setup({})
		require("lspconfig").pyright.setup({})
		require("lspconfig").rust_analyzer.setup({})
		require("lspconfig").tsserver.setup({})
		require("lspconfig").texlab.setup({})
		require("lspconfig").vimls.setup({})
	end,
}
