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
vim.keymap.set("n", "<leader>;k", ":wincmd K<CR>", keyopts)
vim.keymap.set("n", "<leader>;j", ":wincmd J<CR>", keyopts)
vim.keymap.set("n", "<leader>;l", ":wincmd L<CR>", keyopts)
vim.keymap.set("n", "<leader>;h", ":wincmd H<CR>", keyopts)

-- keys of resize window
vim.keymap.set("n", "<leader>;<S-k>", ":horizontal resize +5<CR>", keyopts)
vim.keymap.set("n", "<leader>;<S-j>", ":horizontal resize -5<CR>", keyopts)
vim.keymap.set("n", "<leader>;<S-l>", ":vertical resize -10<CR>", keyopts)
vim.keymap.set("n", "<leader>;<S-h>", ":vertical resize +10<CR>", keyopts)

-- keys of delete buffer or close tab
vim.keymap.set("n", "<S-c>", ":close<CR>", keyopts)
vim.keymap.set("n", "<S-d>", ":bdelete<CR>", keyopts)

-- clipboard register
vim.keymap.set("v", "<C-c>", '"+y', keyopts)

-- tab and buffer
vim.keymap.set("n", "<tab>", ":bnext<CR>", keyopts)
vim.keymap.set("n", "<S-tab>", ":bprevious<CR>", keyopts)
vim.keymap.set("n", "<leader>te", ":tabedit<CR>", keyopts)
vim.keymap.set("n", "<leader><tab>", ":tabnext<CR>", keyopts)
vim.keymap.set("n", "<leader><S-tab>", ":tabprevious<CR>", keyopts)

-- reload the nvim configuration
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", keyopts)

-- the key of language translation
vim.keymap.set("n", "<leader>t", ":lua TranslateTo(':zh')<CR>", keyopts)
vim.keymap.set("n", "<leader>T", ":lua TranslateTo(':en')<CR>", keyopts)

function TranslateTo(language_code)
	local selection = vim.fn.getreg("+")
	selection = '"' .. selection:gsub('"', '\\"') .. '"'
	local command = "trans -b -e bing " .. language_code
	-- .. " "
	-- .. selection
	-- .. " && espeak-ng -v en-us-nyc "
	-- .. selection
	vim.fn["asyncrun#run"](0, { mode = "quickfix" }, command)
end
