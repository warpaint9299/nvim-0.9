-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.clangd.setup {}
lspconfig.bashls.setup {}
lspconfig.lua_ls.setup {}
lspconfig.vimls.setup {}
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		['rust-analyzer'] = {},
	},
})

return lspconfig;
