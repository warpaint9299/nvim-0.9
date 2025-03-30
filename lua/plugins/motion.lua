return {
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
				end,
			})
			vim.api.nvim_create_autocmd("User", {
				pattern = "LeapLeave",
				callback = function()
					vim.o.hlsearch = saved_hls
					vim.cmd.hi("Cursor", "blend=0")
					vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
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
}
