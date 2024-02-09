local settings = {}
function settings.generic()
	vim.opt.history = 10000
	vim.opt.laststatus = 2
	vim.opt.tabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.hlsearch = true
	vim.opt.showcmd = true
	vim.opt.cursorline = true
	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.ignorecase = true
	vim.opt.autoindent = true
	vim.opt.encoding = 'utf-8'
	vim.opt.iskeyword = 'a-z'
	vim.cmd [[colorscheme tokyonight-moon]]
end

function settings.keymap()
	local norkeymap_options = { noremap = true, silent = true };
	vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>', norkeymap_options);
	vim.keymap.set('n', '<S-&>', ':nohlsearch<CR>', norkeymap_options);
	vim.keymap.set('i', 'jk', '<Esc>', nokeymap_options);
	vim.keymap.set('i', '<UP>', '<NOP>', nokeymap_options);
	vim.keymap.set('i', '<DOWN>', '<NOP>', nokeymap_options);
	vim.keymap.set('i', '<LEFT>', '<NOP>', nokeymap_options);
	vim.keymap.set('i', '<RIGHT>', '<NOP>', nokeymap_options);
	vim.g.mapleader = ' '
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	vim.keymap.set('n', '<leader>fc', builtin.commands, {})
end

return settings;
