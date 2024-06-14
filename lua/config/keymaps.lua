local norkeymap_options = { noremap = true, silent = true }
vim.keymap.set("i", "jk", "<Esc>", norkeymap_options)
vim.keymap.set("i", "<UP>", "<NOP>", norkeymap_options)
vim.keymap.set("i", "<DOWN>", "<NOP>", norkeymap_options)
vim.keymap.set("i", "<LEFT>", "<NOP>", norkeymap_options)
vim.keymap.set("i", "<RIGHT>", "<NOP>", norkeymap_options)
vim.keymap.set("i", "<C-h>", "<LEFT>", norkeymap_options)
vim.keymap.set("i", "<C-l>", "<RIGHT>", norkeymap_options)
vim.keymap.set("i", "<C-j>", "<DOWN>", norkeymap_options)
vim.keymap.set("i", "<C-k>", "<UP>", norkeymap_options)
-- keys of split window
vim.keymap.set("n", "sp", ":split", {})
vim.keymap.set("n", "vsp", ":vertical split", {})
vim.keymap.set("n", "<C-UP>", ":horizontal resize +5<CR>", norkeymap_options)
vim.keymap.set("n", "<C-DOWN>", ":horizontal resize -5<CR>", norkeymap_options)
vim.keymap.set("n", "<C-RIGHT>", ":vertical resize -10<CR>", norkeymap_options)
vim.keymap.set("n", "<C-LEFT>", ":vertical resize +10<CR>", norkeymap_options)
vim.keymap.set("n", "<S-UP>", ":topleft split<CR>", norkeymap_options)
vim.keymap.set("n", "<S-DOWN>", ":botright split<CR>", norkeymap_options)
vim.keymap.set("n", "<S-LEFT>", ":vertical topleft split<CR>", norkeymap_options)
vim.keymap.set("n", "<S-RIGHT>", ":vertical botright split<CR>", norkeymap_options)
vim.keymap.set("n", "<S-c>", ":close<CR>", norkeymap_options)
vim.keymap.set("v", "<C-c>", 'y"*', norkeymap_options)
-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", norkeymap_options)
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", norkeymap_options)
-- formatter
vim.keymap.set("n", "<leader>f", ":w<CR>:Format<CR>", norkeymap_options)
-- lsp
vim.keymap.set({ "n", "i" }, "<C-1>", ":Lspsaga code_action<CR>", norkeymap_options)
vim.keymap.set("n", "<leader>t", ":Lspsaga term_toggle<CR>", norkeymap_options)
vim.keymap.set("n", "<leader>r", ":Lspsaga rename<CR>", norkeymap_options)
vim.keymap.set("n", "<leader>o", ":Lspsaga outline<CR>", norkeymap_options)
vim.keymap.set("n", "<S-f>", ":Lspsaga finder<CR>", norkeymap_options)

-- reset default register of keys to avoid overwrite system clipboard
-- vim.keymap.set({ "n", "v" }, "x", '"xx', norkeymap_options)
-- vim.keymap.set({ "n", "v" }, "d", '"dd', norkeymap_options)
-- vim.keymap.set({ "n", "v" }, "s", '"ss', norkeymap_options)
-- vim.keymap.set({ "n", "v" }, "c", '"cc', norkeymap_options)
-- vim.keymap.set({ "n", "v" }, "px", '"xp', norkeymap_options)
-- vim.keymap.set({ "n", "v" }, "pd", '"dp', norkeymap_options)
-- vim.keymap.set({ "n", "v" }, "ps", '"sp', norkeymap_options)
-- vim.keymap.set({ "n", "v" }, "pc", '"cp', norkeymap_options)

--vim.keymap.set(
--	"n",
--	"<C-UP>",
--	':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:topleft split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
--	norkeymap_options
--)
--vim.keymap.set(
--	"n",
--	"<C-DOWN>",
--	':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:botright split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
--	norkeymap_options
--)
--vim.keymap.set(
--	"n",
--	"<C-LEFT>",
--	':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:vertical topleft split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
--	norkeymap_options
--)
--vim.keymap.set(
--	"n",
--	"<C-RIGHT>",
--	':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:vertical botright split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
--	norkeymap_options
--)
