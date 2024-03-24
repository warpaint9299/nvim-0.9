local luasnip = {
	vim.keymap.set({ "i", "s" }, "<S-l>", function()
		require("luasnip").jump(1)
	end, { noremap = true, silent = true }),
	vim.keymap.set({ "i", "s" }, "<S-h>", function()
		require("luasnip").jump(-1)
	end, { noremap = true, silent = true }),
}
return luasnip
