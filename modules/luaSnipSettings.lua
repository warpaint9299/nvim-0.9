local luasnip = {
	vim.keymap.set({ "i", "s", "n" }, "<S-j>", function()
		require("luasnip").jump(1)
	end, { noremap = true, silent = true }),
	vim.keymap.set({ "i", "s", "n" }, "<S-k>", function()
		require("luasnip").jump(-1)
	end, { noremap = true, silent = true }),
}
return luasnip
