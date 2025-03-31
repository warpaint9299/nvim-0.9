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
		"nvimdev/lspsaga.nvim",
		priority = 10000,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "💡",
				},
				lightbulb = {
					enable = true,
					sign = false,
					sign_priority = 2048,
				},
				implement = {
					enable = true,
					virtual_text = true,
					priority = 1024,
				},
				outline = {
					layout = "float", -- float or normal default is normal when is float above options will
					keys = {
						toggle_or_jump = "o", -- toggle or jump
						quit = "q", -- quit outline window
						jump = "e", -- jump to pos even on a expand/collapse node
					},
				},
			})
			vim.keymap.set({ "v", "n" }, "<C-space>", ":Lspsaga code_action<CR>", { silent = true })
			vim.keymap.set({ "v", "n" }, "gd", ":Lspsaga goto_definition<CR>", { silent = true })
			vim.keymap.set({ "v", "n" }, "gD", ":Lspsaga goto_type_definition<CR>", { silent = true })
			vim.keymap.set({ "v", "n" }, "gf", ":Lspsaga finder<CR>", { silent = true })
			vim.keymap.set({ "v", "n" }, "<leader>o", ":Lspsaga outline<CR>", { silent = true })
			vim.keymap.set({ "v", "n" }, "<leader>sd", ":Lspsaga show_buf_diagnostics<CR>", { silent = true })
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
		priority = 10000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "modern",
				blend = {
					factor = 0,
				},
				transparent_bg = false,
				hi = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
					arrow = "NonText",
					background = "CursorLine",
					mixing_color = "None",
				},
				options = {
					show_source = true,
					use_icons_from_diagnostic = false,
					set_arrow_to_diag_color = true,
					add_messages = true,
					throttle = 20,
					softwrap = 30,
					multilines = {
						enabled = false,
						always_show = false,
					},

					show_all_diags_on_cursorline = false,
					enable_on_insert = false,
					enable_on_select = false,
					overflow = {
						mode = "wrap",
						padding = 0,
					},
					break_line = {
						enabled = true,
						after = 30,
					},

					-- Custom format function for diagnostic messages
					-- Example:
					-- format = function(diagnostic)
					--     return diagnostic.message .. " [" .. diagnostic.source .. "]"
					-- end
					format = nil,

					virt_texts = {
						priority = 2048,
					},
					severity = {
						vim.diagnostic.severity.ERROR,
						vim.diagnostic.severity.WARN,
						vim.diagnostic.severity.INFO,
						vim.diagnostic.severity.HINT,
					},

					overwrite_events = nil,
				},
				disabled_ft = {}, -- List of filetypes to disable the plugin
			})
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
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
}
