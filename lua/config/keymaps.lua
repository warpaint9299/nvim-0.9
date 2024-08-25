local keyopts = { noremap = true, silent = true }
-- save file
vim.keymap.set("n", "<C-s>", ":write<CR>", keyopts)

-- insert mode
vim.keymap.set({ "i", "s", "t" }, "jk", "<Esc>", keyopts)
vim.keymap.set("i", "<UP>", "<NOP>", keyopts)
vim.keymap.set("i", "<DOWN>", "<NOP>", keyopts)
vim.keymap.set("i", "<LEFT>", "<NOP>", keyopts)
vim.keymap.set("i", "<RIGHT>", "<NOP>", keyopts)
vim.keymap.set("i", "<C-l>", "<RIGHT>", keyopts)

-- keys of moving window
vim.keymap.set("n", ";k", ":wincmd K<CR>", keyopts)
vim.keymap.set("n", ";j", ":wincmd J<CR>", keyopts)
vim.keymap.set("n", ";l", ":wincmd L<CR>", keyopts)
vim.keymap.set("n", ";h", ":wincmd H<CR>", keyopts)

-- keys of resize window
vim.keymap.set("n", ";<S-k>", ":horizontal resize +5<CR>", keyopts)
vim.keymap.set("n", ";<S-j>", ":horizontal resize -5<CR>", keyopts)
vim.keymap.set("n", ";<S-l>", ":vertical resize -10<CR>", keyopts)
vim.keymap.set("n", ";<S-h>", ":vertical resize +10<CR>", keyopts)

-- keys of delete buffer or close tab
vim.keymap.set("n", "<S-c>", ":close<CR>", keyopts)
vim.keymap.set("n", "<S-d>", ":bdelete<CR>", keyopts)

-- formatter
vim.keymap.set("n", "<leader>f", ":Format<CR>", keyopts)

-- lsp
vim.keymap.set("n", ";1", ":Lspsaga code_action<CR>", keyopts)
vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", keyopts)

-- clipboard register
vim.keymap.set("v", "<C-c>", '"+y', keyopts)

-- translate
vim.keymap.set("v", ";t", "<cmd>TransToZH<CR>", keyopts)
vim.keymap.set("n", ";t", "<cmd>TransToEN<CR>")

-- tab and buffer
vim.keymap.set("n", "<tab>", ":bnext<CR>", keyopts)
vim.keymap.set("n", "<S-tab>", ":bprevious<CR>", keyopts)
vim.keymap.set("n", ";te", ":tabedit<CR>", keyopts)
vim.keymap.set("n", ";<tab>", ":tabnext<CR>", keyopts)
vim.keymap.set("n", ";<S-tab>", ":tabprevious<CR>", keyopts)
