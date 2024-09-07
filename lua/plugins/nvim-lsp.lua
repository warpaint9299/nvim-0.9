return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup({})
			require("mason-lspconfig").setup({})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"asm-lsp",
					"awk-language-server",
					"bash-debug-adapter",
					"bash-language-server",
					"clang-format",
					"clangd",
					"codelldb",
					"css-lsp",
					"debugpy",
					"dot-language-server",
					"google-java-format",
					"gopls",
					"gradle-language-server",
					"grammarly-languageserver",
					"html-lsp",
					"java-debug-adapter",
					"java-test",
					"jdtls",
					"kotlin-debug-adapter",
					"kotlin-language-server",
					"latexindent",
					"lua-language-server",
					"marksman",
					"perlnavigator",
					"prettier",
					"pyright",
					"rust-analyzer",
					"stylua",
					"texlab",
					"typescript-language-server",
					"vim-language-server",
				},
				auto_update = false,
				run_on_start = true,
				start_delay = 3000,
				integrations = {
					["mason-lspconfig"] = true,
					["mason-nvim-dap"] = true,
				},
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("lspconfig").asm_lsp.setup({
				capabilities = capabilities,
			})
			require("lspconfig").awk_ls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").bashls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").clangd.setup({
				capabilities = capabilities,
			})
			require("lspconfig").cssls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").dotls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").gopls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").gradle_ls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").grammarly.setup({
				capabilities = capabilities,
			})
			require("lspconfig").html.setup({
				capabilities = capabilities,
			})
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").marksman.setup({
				capabilities = capabilities,
			})
			require("lspconfig").perlnavigator.setup({
				capabilities = capabilities,
			})
			require("lspconfig").pyright.setup({
				capabilities = capabilities,
			})
			require("lspconfig").rust_analyzer.setup({
				capabilities = capabilities,
			})
			require("lspconfig").texlab.setup({
				capabilities = capabilities,
			})
			require("lspconfig").vimls.setup({
				capabilities = capabilities,
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("typescript-tools").setup({
				settings = {
					-- spawn additional tsserver instance to calculate diagnostics on it
					separate_diagnostic_server = true,
					-- "change"|"insert_leave" determine when the client asks the server about diagnostic
					publish_diagnostic_on = "insert_leave",
					-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
					-- "remove_unused_imports"|"organize_imports") -- or string "all"
					-- to include all supported code actions
					-- specify commands exposed as code_actions
					expose_as_code_action = {},
					-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
					-- not exists then standard path resolution strategy is applied
					tsserver_path = nil,
					-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
					-- (see 💅 `styled-components` support section)
					tsserver_plugins = {},
					-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
					-- memory limit in megabytes or "auto"(basically no limit)
					tsserver_max_memory = "auto",
					-- described below
					tsserver_format_options = {},
					tsserver_file_preferences = {},
					-- locale of all tsserver messages, supported locales you can find here:
					-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
					tsserver_locale = "en",
					-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
					complete_function_calls = true,
					include_completions_with_insert_text = true,
					-- CodeLens
					-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
					-- possible values: ("off"|"all"|"implementations_only"|"references_only")
					code_lens = "off",
					-- by default code lenses are displayed on all referencable values and for some of you it can
					-- be too much this option reduce count of them by removing member references from lenses
					disable_member_code_lens = true,
					-- JSXCloseTag
					-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
					-- that maybe have a conflict if enable this feature. )
					jsx_close_tag = {
						enable = false,
						filetypes = { "javascriptreact", "typescriptreact" },
					},
				},
			})
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup({
				signs = {
					left = "",
					right = "",
					diag = "●",
					arrow = "    ",
					up_arrow = "    ",
					vertical = " │",
					vertical_end = " └",
				},
				options = {
					-- Show the source of the diagnostic.
					show_source = true,
					-- If multiple diagnostics are under the cursor, display all of them.
					multiple_diag_under_cursor = true,
					overflow = {
						-- Manage the overflow of the message.
						--    - wrap: when the message is too long, it is then displayed on multiple lines.
						--    - none: the message will not be truncated.
						--    - oneline: message will be displayed entirely on one line.
						mode = "wrap",
					},
					format = nil,
					virt_texts = {
						priority = 2048,
					},
				},
			})
		end,
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				mode = "symbol_text",
				preset = "default",
				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
				},
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			local keyopts = { noremap = true, silent = true }
			-- lsp
			vim.keymap.set("n", "<leader>;a", ":Lspsaga code_action<CR>", keyopts)
			vim.keymap.set("n", "<leader>;f", ":Lspsaga finder<CR>", keyopts)
			vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", keyopts)
			require("lspsaga").setup({
				lightbulb = {
					enable = true,
					sign = true,
					virtual_text = false,
					debounce = 10,
					sign_priority = 20,
				},
				ui = {
					winblend = 10,
					border = "rounded",
					code_action = "💡",
					colors = {
						normal_bg = "NONE",
					},
				},
				beacon = {
					enable = false,
				},
			})
		end,
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "LspAttach", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
		config = function()
			local function h(name)
				return vim.api.nvim_get_hl(0, { name = name })
			end

			vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg, italic = true })
			vim.api.nvim_set_hl(
				0,
				"SymbolUsageContent",
				{ bg = h("CursorLine").bg, fg = h("Comment").fg, italic = true }
			)
			vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("CursorLine").bg, italic = true })
			vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("CursorLine").bg, italic = true })
			vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("CursorLine").bg, italic = true })

			local function text_format(symbol)
				local res = {}

				local round_start = { "", "SymbolUsageRounding" }
				local round_end = { "", "SymbolUsageRounding" }

				-- Indicator that shows if there are any other symbols in the same line
				local stacked_functions_content = symbol.stacked_count > 0 and ("+%s"):format(symbol.stacked_count)
					or ""

				if symbol.references then
					local usage = symbol.references <= 1 and "usage" or "usages"
					local num = symbol.references == 0 and "no" or symbol.references
					table.insert(res, round_start)
					table.insert(res, { "󰌹 ", "Question" })
					table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
					table.insert(res, round_end)
				end

				if symbol.definition then
					if #res > 0 then
						table.insert(res, { " ", "NonText" })
					end
					table.insert(res, round_start)
					table.insert(res, { "󰳽 ", "Number" })
					table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
					table.insert(res, round_end)
				end

				if symbol.implementation then
					if #res > 0 then
						table.insert(res, { " ", "NonText" })
					end
					table.insert(res, round_start)
					table.insert(res, { "󰡱 ", "Function" })
					table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
					table.insert(res, round_end)
				end

				if stacked_functions_content ~= "" then
					if #res > 0 then
						table.insert(res, { " ", "NonText" })
					end
					table.insert(res, round_start)
					table.insert(res, { " ", "SymbolUsageImpl" })
					table.insert(res, { stacked_functions_content, "SymbolUsageContent" })
					table.insert(res, round_end)
				end

				return res
			end
			local SymbolKind = vim.lsp.protocol.SymbolKind
			---@type UserOpts
			require("symbol-usage").setup({
				---@type table<string, any> `nvim_set_hl`-like options for highlight virtual text
				hl = { link = "Comment" },
				---@type lsp.SymbolKind[] Symbol kinds what need to be count (see `lsp.SymbolKind`)
				kinds = { SymbolKind.Function, SymbolKind.Method },
				---Additional filter for kinds. Recommended use in the filetypes override table.
				---fiterKind: function(data: { symbol:table, parent:table, bufnr:integer }): boolean
				---`symbol` and `parent` is an item from `textDocument/documentSymbol` request
				---See: #filter-kinds
				---@type table<lsp.SymbolKind, filterKind[]>
				kinds_filter = {},
				---@type 'above'|'end_of_line'|'textwidth'|'signcolumn' `above` by default
				vt_position = "above",
				vt_priority = nil, ---@type integer Virtual text priority (see `nvim_buf_set_extmark`)
				---Text to display when request is pending. If `false`, extmark will not be
				---created until the request is finished. Recommended to use with `above`
				---vt_position to avoid "jumping lines".
				---@type string|table|false
				request_pending_text = "loading...",
				---The function can return a string to which the highlighting group from `opts.hl` is applied.
				---Alternatively, it can return a table of tuples of the form `{ { text, hl_group }, ... }`` - in this case the specified groups will be applied.
				---If `vt_position` is 'signcolumn', then only a 1-2 length string or a `{{ icon, hl_group }}` table is expected.
				---See `#format-text-examples`
				---@type function(symbol: Symbol): string|table Symbol{ definition = integer|nil, implementation = integer|nil, references = integer|nil, stacked_count = integer, stacked_symbols = table<SymbolId, Symbol> }
				text_format = text_format,
				references = { enabled = true, include_declaration = false },
				definition = { enabled = true },
				implementation = { enabled = true },
				---@type { lsp?: string[], filetypes?: string[], cond?: function[] } Disables `symbol-usage.nvim' for specific LSPs, filetypes, or on custom conditions.
				---The function in the `cond` list takes an argument `bufnr` and returns a boolean. If it returns true, `symbol-usage` will not run in that buffer.
				disable = { lsp = {}, filetypes = {}, cond = {} },
				---@type UserOpts[] See default overridings in `lua/symbol-usage/langs.lua`
				-- filetypes = {},
				---@type 'start'|'end' At which position of `symbol.selectionRange` the request to the lsp server should start. Default is `end` (try changing it to `start` if the symbol counting is not correct).
				symbol_request_pos = "end", -- Recommended redefine only in `filetypes` override table
				---@type LoggerConfig
				log = { enabled = false },
			})
		end,
	},
}
