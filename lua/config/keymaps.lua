local norkeymap_options = { noremap = true, silent = true }
-- save file
vim.keymap.set("n", "<C-s>", ":write<CR>", norkeymap_options)

-- insert mode
vim.keymap.set({ "i", "s", "t" }, "jk", "<Esc>", norkeymap_options)
vim.keymap.set("i", "<UP>", "<NOP>", norkeymap_options)
vim.keymap.set("i", "<DOWN>", "<NOP>", norkeymap_options)
vim.keymap.set("i", "<LEFT>", "<NOP>", norkeymap_options)
vim.keymap.set("i", "<RIGHT>", "<NOP>", norkeymap_options)
-- vim.keymap.set("i", "<C-j>", "<DOWN>", norkeymap_options)
-- vim.keymap.set("i", "<C-k>", "<UP>", norkeymap_options)
-- vim.keymap.set("i", "<C-h>", "<LEFT>", norkeymap_options)
vim.keymap.set("i", "<C-l>", "<RIGHT>", norkeymap_options)

-- keys of split window
vim.keymap.set("n", "<C-UP>", ":horizontal resize +5<CR>", norkeymap_options)
vim.keymap.set("n", "<C-DOWN>", ":horizontal resize -5<CR>", norkeymap_options)
vim.keymap.set("n", "<C-RIGHT>", ":vertical resize -10<CR>", norkeymap_options)
vim.keymap.set("n", "<C-LEFT>", ":vertical resize +10<CR>", norkeymap_options)
vim.keymap.set("n", "<S-c>", ":close<CR>", norkeymap_options)

-- formatter
vim.keymap.set("n", "<leader>f", ":Format<CR>", norkeymap_options)

-- lsp
vim.keymap.set("n", "<leader>1", ":Lspsaga code_action<CR>", norkeymap_options)
vim.keymap.set("n", "<A-t>", ":Lspsaga term_toggle<CR>", norkeymap_options)
vim.keymap.set("n", "<leader>r", ":Lspsaga rename<CR>", norkeymap_options)
vim.keymap.set("n", "<leader>o", ":Lspsaga outline<CR>", norkeymap_options)
vim.keymap.set("n", "gf", ":Lspsaga finder<CR>", norkeymap_options)
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", norkeymap_options)
vim.keymap.set("n", "sd", ":Lspsaga show_line_diagnostics<CR>", norkeymap_options)

-- clipboard register
vim.keymap.set("v", "<C-c>", '"+y', norkeymap_options)
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', norkeymap_options)
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', norkeymap_options)

-- translate
vim.keymap.set("v", "<C-t>", "<cmd>TransToZH<CR>", norkeymap_options)
vim.keymap.set("n", "<space>T", "<cmd>TransToEN<CR>")

vim.keymap.set("n", "<leader>no", "<cmd>set hlsearch!<CR>", norkeymap_options)
