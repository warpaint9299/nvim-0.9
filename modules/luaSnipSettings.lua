local luasnip = {
	vim.keymap.set({ "i", "s" }, "<C-L>", function()
		require("luasnip").jump(1)
	end, { noremap = true, silent = true }),
	vim.keymap.set({ "i", "s" }, "<C-H>", function()
		require("luasnip").jump(-1)
	end, { noremap = true, silent = true }),
}
return luasnip
