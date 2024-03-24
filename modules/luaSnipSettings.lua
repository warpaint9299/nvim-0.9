local luasnip = {
	vim.keymap.set({ "i", "s" }, "<S-n>", function()
		require("luasnip").jump(1)
	end, { noremap = true, silent = true }),
	vim.keymap.set({ "i", "s" }, "<S-p>", function()
		require("luasnip").jump(-1)
	end, { noremap = true, silent = true }),
}
return luasnip
