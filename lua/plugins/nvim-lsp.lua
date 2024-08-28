return {
	{
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
			require("lspconfig").texlab.setup({})
			require("lspconfig").vimls.setup({})
		end,
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
					left = "",
					right = "",
					diag = "●",
					arrow = "    ",
					up_arrow = "    ",
					vertical = " │",
					vertical_end = " └",
				},
				hi = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
					arrow = "NonText",
					background = "None", -- Can be a highlight or a hexadecimal color (#RRGGBB)
					mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
				},
				blend = {
					factor = 0.27,
				},
				options = {
					show_source = false,
					throttle = 20,
					softwrap = 15,
					multiple_diag_under_cursor = false,
					multilines = false,
					overflow = {
						-- Manage the overflow of the message.
						--    - wrap: when the message is too long, it is then displayed on multiple lines.
						--    - none: the message will not be truncated.
						--    - oneline: message will be displayed entirely on one line.
						mode = "wrap",
					},
					format = nil,
					break_line = {
						enabled = false,
						after = 30,
					},
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
				-- DEPRECATED (use mode instead): enables text annotations
				--
				-- default: true
				-- with_text = true,

				-- defines how annotations are shown
				-- default: symbol
				-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
				mode = "symbol_text",

				-- default symbol map
				-- can be either 'default' (requires nerd-fonts font) or
				-- 'codicons' for codicon preset (requires vscode-codicons font)
				--
				-- default: 'default'
				preset = "codicons",

				-- override preset symbols
				--
				-- default: {}
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
		config = function()
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
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
