local luasnip = {
	vim.keymap.set({ "i", "s", "n" }, "<C-n>", function()
		require("luasnip").jump(1)
	end, { noremap = true, silent = true }),
	vim.keymap.set({ "i", "s", "n" }, "<C-p>", function()
		require("luasnip").jump(-1)
	end, { noremap = true, silent = true }),
}
return luasnip
