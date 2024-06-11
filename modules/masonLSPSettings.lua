-- Setup language servers.
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({})
lspconfig.bashls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.vimls.setup({})
lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.jdtls.setup({})
lspconfig.gradle_ls.setup({})
lspconfig.kotlin_language_server.setup({})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

vim.diagnostic.config({

	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

return lspconfig
