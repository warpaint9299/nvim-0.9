return {
	{
		"cbochs/portal.nvim",
		-- Optional dependencies
		dependencies = {
			"cbochs/grapple.nvim",
			"ThePrimeagen/harpoon",
		},
		config = function()
			require("portal").setup({
				---@type "debug" | "info" | "warn" | "error"
				log_level = "warn",

				---The base filter applied to every search.
				---@type Portal.SearchPredicate | nil
				filter = nil,

				---The maximum number of results for any search.
				---@type integer | nil
				max_results = nil,

				---The maximum number of items that can be searched.
				---@type integer
				lookback = 100,

				---An ordered list of keys for labelling portals.
				---Labels will be applied in order, or to match slotted results.
				---@type string[]
				labels = { "j", "k", "h", "l" },

				---Select the first portal when there is only one result.
				select_first = false,

				---Keys used for exiting portal selection. Disable with [{key}] = false
				---to `false`.
				---@type table<string, boolean>
				escape = {
					["<esc>"] = true,
				},

				---The raw window options used for the portal window
				window_options = {
					relative = "cursor",
					width = 80,
					height = 3,
					col = 2,
					focusable = false,
					border = "single",
					noautocmd = true,
				},
			})
			vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
			vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")
		end,
	},
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"chrisgrieser/nvim-spider",
		lazy = true,
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
			{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
			{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		},
		config = function()
			-- default values
			require("spider").setup({
				skipInsignificantPunctuation = true,
				consistentOperatorPending = false, -- see "Consistent Operator-pending Mode" in the README
				subwordMovement = true,
				customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
			})
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
				},
			})
			-- require("leap.user").set_repeat_keys("<enter>", "<backspace>")
			require("leap.user").set_repeat_keys(";", ",")
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
