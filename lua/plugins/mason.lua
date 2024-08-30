return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			ensure_installed = {
				"bash-debug-adapter",
				"bash-language-server",
				"clang-format",
				"clangd",
				"codelldb",
				"css-lsp",
				"debugpy",
				"google-java-format",
				"html-lsp",
				"java-debug-adapter",
				"java-test",
				"jdtls",
				"kotlin-language-server",
				"latexindent",
				"lua-language-server",
				"marksman",
				"prettier",
				"pyright",
				"rust-analyzer",
				"stylua",
				"texlab",
				"typescript-language-server",
				"vim-language-server",
			},
		})
	end,
}
