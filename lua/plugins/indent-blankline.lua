return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			indent = {
				char = { "¦", "┆" }, -- "|", "¦", "┆", "┊"
				smart_indent_cap = true,
				repeat_linebreak = false,
			},
			whitespace = {
				highlight = {
					"Whitespace",
					"NonText",
				},
				remove_blankline_trail = true,
			},
			scope = {
				enabled = false,
			},
		})
	end,
}
