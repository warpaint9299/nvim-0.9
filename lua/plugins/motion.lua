return {
	{
		"backdround/improved-search.nvim",
		config = function()
			local search = require("improved-search")
			-- Search next / previous.
			vim.keymap.set({ "n", "x", "o" }, ";", search.stable_next)
			vim.keymap.set({ "n", "x", "o" }, ",", search.stable_previous)

			-- Search current word without moving.
			vim.keymap.set("n", "!", search.current_word)

			-- Search selected text in visual mode
			vim.keymap.set("x", "!", search.in_place) -- search selection without moving
			vim.keymap.set("x", "*", search.backward) -- search selection backward
			vim.keymap.set("x", "#", search.forward) -- search selection forward

			-- Search by motion in place
			vim.keymap.set("n", "|", search.in_place)
			-- You can also use search.forward / search.backward for motion selection.
		end,
	},
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"ggandor/flit.nvim",
		dependencies = {
			"ggandor/leap.nvim",
			"tpope/vim-repeat",
		},
		config = function()
			require("flit").setup({
				keys = { f = "f", F = "F", t = "t", T = "T" },
				-- A string like "nv", "nvo", "o", etc.
				labeled_modes = "v",
				-- Repeat with the trigger key itself.
				clever_repeat = true,
				multiline = true,
				-- Like `leap`s similar argument (call-specific overrides).
				-- E.g.: opts = { equivalence_classes = {} }
				opts = {
					equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" },
					case_sensitive = false,
				},
			})
			local leap = require("leap")
			leap.opts.preview_filter = function()
				return false
			end
			local saved_hls
			vim.api.nvim_create_autocmd("User", {
				pattern = "LeapEnter",
				callback = function()
					saved_hls = vim.o.hlsearch
					vim.o.hlsearch = false
					vim.cmd.hi("Cursor", "blend=100")
					vim.opt.guicursor:append({ "a:Cursor/lCursor" })
					vim.api.nvim_set_hl(0, "Cursor", { fg = "#E0E0E0" })
				end,
			})
			vim.api.nvim_create_autocmd("User", {
				pattern = "LeapLeave",
				callback = function()
					vim.o.hlsearch = saved_hls
					vim.cmd.hi("Cursor", "blend=0")
					vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
					vim.api.nvim_set_hl(0, "Cursor", { fg = "None" })
				end,
			})
			vim.keymap.set("n", "s", "<Plug>(leap-anywhere)")
			vim.keymap.set("x", "s", "<Plug>(leap)")
			vim.keymap.set("o", "s", "<Plug>(leap-forward)")
			vim.keymap.set("o", "S", "<Plug>(leap-backward)")
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				keymaps = {
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "ys",
					normal_cur = "yss",
					normal_line = "yS",
					normal_cur_line = "ySS",
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
					change_line = "cS",
				},
			})
		end,
	},
	{
		"echasnovski/mini.move",
		version = "*",
		config = function()
			require("mini.move").setup(
				-- No need to copy this inside `setup()`. Will be used automatically.
				{
					-- Module mappings. Use `''` (empty string) to disable one.
					mappings = {
						-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
						left = "<C-h>",
						right = "<C-l>",
						down = "<C-j>",
						up = "<C-k>",

						-- Move current line in Normal mode
						line_left = "<C-h>",
						line_right = "<C-l>",
						line_down = "<C-j>",
						line_up = "<C-k>",
					},

					-- Options which control moving behavior
					options = {
						-- Automatically reindent selection during linewise vertical move
						reindent_linewise = true,
					},
				}
			)
		end,
	},
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({
				cyclic = true,
				bookmark_0 = {
					sign = "",
					virt_text = "",
					annotate = false,
				},
				mappings = {
					-- set_next = "m.",
					-- next = "mn",
					-- prev = "m.",
					-- delete_line = "dml",
					delete_buf = "dmb",
					delete_bookmark = "dm.",
					set_bookmark0 = "mm",
					next_bookmark0 = "mn",
					prev_bookmark0 = "m,",
					delete_bookmark0 = "dmm",
				},
			})
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local sources = require("dropbar.sources")
			local utils = require("dropbar.utils")

			require("dropbar").setup({
				bar = {
					sources = function(buf, _)
						if vim.bo[buf].ft == "markdown" then
							return { sources.markdown }
						end
						if vim.bo[buf].buftype == "terminal" then
							return { sources.terminal }
						end
						return {
							sources.path,
							utils.source.fallback({
								sources.lsp,
							}),
						}
					end,
				},
				sources = {
					path = {
						max_depth = 2,
					},
				},
			})
		end,
	},
	{
		"Asheq/close-buffers.vim",
		config = function() end,
	},
}
