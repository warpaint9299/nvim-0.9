return {
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
			opts = {},
		})
		-- "clever-a"
		vim.keymap.set({ "n", "x", "o" }, "ga", function()
			local sk = vim.deepcopy(require("leap").opts.special_keys)
			-- The items in `special_keys` can be both strings or tables - the
			-- shortest workaround might be the below one:
			sk.next_target = vim.fn.flatten(vim.list_extend({ "A" }, { sk.next_target }))
			sk.prev_target = vim.fn.flatten(vim.list_extend({ "a" }, { sk.prev_target }))

			require("leap.treesitter").select({ opts = { special_keys = sk } })
		end, { desc = "Leap Treesitter selection" })
	end,
}
