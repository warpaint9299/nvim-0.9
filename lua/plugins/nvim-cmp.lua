return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"ray-x/cmp-treesitter",
			"ray-x/cmp-sql",
			"micangl/cmp-vimtex",
			"rcarriga/cmp-dap",
		},
		config = function()
			local cmp = require("cmp")
			vim.cmd([[let g:vsnip_snippet_dir = stdpath("config") .. "/snippets" ]])

			-- Set configuration for specific filetype.
			cmp.setup.filetype({ "markdown", "text" }, {
				experimental = {
					ghost_text = false,
				},
				sources = cmp.config.sources({
					{ name = "vsnip" },
					{ name = "path" },
				}),
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "dap" },
				},
			})
			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local feedkey = function(key, mode)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
			end

			vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
			vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
			vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
			vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
			vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
			vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
			vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
			vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
			vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

			vim.lsp.set_log_level("off")

			cmp.setup({
				enabled = function()
					return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
				end,
				experimental = {
					ghost_text = true,
				},
				filetype = {},
				formatting = {
					format = function(entry, vim_item)
						if vim.tbl_contains({ "path" }, entry.source.name) then
							local icon, hl_group =
								require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
							if icon then
								vim_item.kind = icon
								vim_item.kind_hl_group = hl_group
								return vim_item
							end
						end
						return require("lspkind").cmp_format({
							mode = "symbol_text",
							menu = {
								buffer = "[Buffer]",
								nvim_lsp = "[LSP]",
								vsnip = "[VSnip]",
								nvim_lua = "[Lua]",
								latex_symbols = "[Latex]",
							},
							with_text = false,
						})(entry, vim_item)
					end,
				},
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-a>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.SelectBehavior.Select }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						elseif vim.fn["vsnip#available"](1) == 1 then
							feedkey("<Plug>(vsnip-expand-or-jump)", "")
						else
							fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
						end
					end, { "n", "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						elseif vim.fn["vsnip#jumpable"](-1) == 1 then
							feedkey("<Plug>(vsnip-jump-prev)", "")
						elseif has_words_before() then
							cmp.complete()
						end
					end, { "n", "i", "s" }),
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "vsnip" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lua" },
					{ name = "treesitter" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
					-- { name = "sql" },
					{ name = "vimtex" },
				}),
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").setup({
				debug = false, -- set to true to enable debug logging
				log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
				-- default is  ~/.cache/nvim/lsp_signature.log
				verbose = false, -- show debug line number

				bind = true, -- This is mandatory, otherwise border config won't get registered.
				-- If you want to hook lspsaga or other signature handler, pls set to false
				doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
				-- set to 0 if you DO NOT want any API comments be shown
				-- This setting only take effect in insert mode, it does not affect signature help in normal
				-- mode, 10 by default

				max_height = 12, -- max height of signature floating_window
				-- the value need >= 40
				-- if max_width is function, it will be called
				wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
				floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

				floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
				-- will set to true when fully tested, set to false will use whichever side has more space
				-- this setting will be helpful if you do not want the PUM and floating win overlap

				floating_window_off_x = 1, -- adjust float windows x position.
				-- can be either a number or function
				floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
				-- can be either number or function, see examples

				close_timeout = 4000, -- close floating window after ms when laster parameter is entered
				fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
				hint_enable = false, -- virtual hint enable
				hint_prefix = "🐼", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
				-- or, provide a table with 3 icons
				-- hint_prefix = {
				--     above = "↙ ",  -- when the hint is on the line above the current line
				--     current = "← ",  -- when the hint is on the same line
				--     below = "↖ "  -- when the hint is on the line below the current line
				-- }
				hint_scheme = "String",
				hint_inline = function()
					return false
				end, -- should the hint be inline(nvim 0.10 only)?  default false
				-- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
				-- return 'right_align' to display hint right aligned in the current line
				hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
				handler_opts = {
					border = "single", -- double, rounded, single, shadow, none, or a table of borders
				},

				always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

				auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
				extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
				zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

				padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc

				transparency = nil, -- disabled by default, allow floating win transparent value 1~100
				shadow_blend = 36, -- if you using shadow as border use this set the opacity
				shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
				timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
				toggle_key = "<C-x>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
				toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
				-- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
				-- may not popup when typing depends on floating_window setting

				select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
				move_signature_window_key = nil, -- move the floating window, e.g. {'<M-k>', '<M-j>'} to move up and down, or
				-- table of 4 keymaps, e.g. {'<M-k>', '<M-j>', '<M-h>', '<M-l>'} to move up, down, left, right
				move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating window
				-- e.g. move_cursor_key = '<M-p>',
				-- once moved to floating window, you can use <M-d>, <M-u> to move cursor up and down
				keymaps = {}, -- relate to move_cursor_key; the keymaps inside floating window with arguments of bufnr
				-- e.g. keymaps = function(bufnr) vim.keymap.set(...) end
				-- it can be function that set keymaps
				-- e.g. keymaps = { { 'j', '<C-o>j' }, } this map j to <C-o>j in floating window
				-- <M-d> and <M-u> are default keymaps to move cursor up and down
			})
		end,
	},
}
