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
					"kotlin-debug-adapter",
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
				auto_update = false,
				run_on_start = true,
				start_delay = 3000,
				integrations = {
					["mason-lspconfig"] = true,
					["mason-nvim-dap"] = true,
				},
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("lspconfig").bashls.setup({
				capabilities = capabilities,
			})
			require("lspconfig").clangd.setup({
				capabilities = capabilities,
			})
			require("lspconfig").cssls.setup({
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
			vim.keymap.set("n", "<leader>;1", ":Lspsaga code_action<CR>", keyopts)
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
}
