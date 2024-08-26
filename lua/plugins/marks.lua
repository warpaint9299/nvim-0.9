return {
	"chentoast/marks.nvim",
	config = function()
		require("marks").setup({
			cyclic = true,
			mappings = {
				set_next = "mm",
				next = "mn",
				prev = "m,",
				delete_line = "dmx",
				delete_buf = "dmz",
			},
		})
	end,
}
