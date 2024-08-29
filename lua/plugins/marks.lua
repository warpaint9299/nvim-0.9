return {
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
				set_next = "<leader>;mm",
				next = "<leader>;mn",
				prev = "<leader>;m,",
				delete_line = "<leader>;dmx",
				delete_buf = "<leader>;dmz",
				delete_bookmark = "dmx",
				set_bookmark0 = "mm",
				next_bookmark0 = "mn",
				prev_bookmark0 = "m,",
				delete_bookmark0 = "dmm",
			},
		})
	end,
}
