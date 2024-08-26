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
				set_next = ";mm",
				next = ";mn",
				prev = ";m,",
				delete_line = ";dmx",
				delete_buf = ";dmz",
				delete_bookmark = "dmx",
				set_bookmark0 = "mm",
				next_bookmark0 = "mn",
				prev_bookmark0 = "m,",
				delete_bookmark0 = "dmz",
			},
		})
	end,
}