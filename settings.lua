local settings = {}

function settings.generic()
	vim.opt.history = 10000
	vim.opt.laststatus = 2
	vim.opt.tabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.number = false
	vim.opt.relativenumber = true
	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.hlsearch = true
	vim.opt.showcmd = true
	vim.opt.cursorline = true
	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.ignorecase = false
	vim.opt.autoindent = true
	vim.opt.encoding = 'utf-8'
	vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
	--	vim.opt.iskeyword = 'a-z'
	vim.cmd [[colorscheme tokyonight-moon]]
	vim.cmd([[
	augroup RememberCursorPosition
	  autocmd!
	  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
	augroup END
	]])
end

function settings.keymap()
	local norkeymap_options = { noremap = true, silent = true };
	vim.keymap.set('i', 'jk', '<Esc>', nokeymap_options);
	vim.keymap.set('i', '<UP>', '<NOP>', nokeymap_options);
	vim.keymap.set('i', '<DOWN>', '<NOP>', nokeymap_options);
	vim.keymap.set('i', '<LEFT>', '<NOP>', nokeymap_options);
	vim.keymap.set('i', '<RIGHT>', '<NOP>', nokeymap_options);
	-- keys of split window
	vim.keymap.set('n', 'sp', ':split', {});
	vim.keymap.set('n', 'vsp', ':vertical split', {});
	vim.keymap.set('n', '<A-UP>', ':horizontal resize +5<CR>', norkeymap_options);
	vim.keymap.set('n', '<A-DOWN>', ':horizontal resize -5<CR>', norkeymap_options);
	vim.keymap.set('n', '<A-RIGHT>', ':vertical resize -10<CR>', norkeymap_options);
	vim.keymap.set('n', '<A-LEFT>', ':vertical resize +10<CR>', norkeymap_options);
	vim.keymap.set('n', '<C-UP>', ':let @p=@%<CR>:close<CR>:topleft split <C-r>p<CR>', norkeymap_options);
	vim.keymap.set('n', '<C-DOWN>', ':let @p=@%<CR>:close<CR>:botright split <C-r>p<CR>', norkeymap_options);
	vim.keymap.set('n', '<C-LEFT>', ':let @p=@%<CR>:close<CR>:vertical topleft split <C-r>p<CR>', norkeymap_options);
	vim.keymap.set('n', '<C-RIGHT>', ':let @p=@%<CR>:close<CR>:vertical botright split <C-r>p<CR>', norkeymap_options);
	vim.keymap.set('n', '<A-S-UP>', ':topleft split<CR>', norkeymap_options);
	vim.keymap.set('n', '<A-S-DOWN>', ':botright split<CR>', norkeymap_options);
	vim.keymap.set('n', '<A-S-LEFT>', ':vertical topleft split<CR>', norkeymap_options);
	vim.keymap.set('n', '<A-S-RIGHT>', ':vertical botright split<CR>', norkeymap_options);
	vim.keymap.set('n', '<S-c>', ':close<CR>', norkeymap_options);
	vim.keymap.set('v', '<C-c>', 'y"*', norkeymap_options);
	-- reset default register of keys to avoid overwrite system clipboard
	vim.keymap.set('n', 'x', '"xx', norkeymap_options);
	vim.keymap.set('v', 'x', '"xx', norkeymap_options);
	vim.keymap.set('n', 'd', '"dd', norkeymap_options);
	vim.keymap.set('v', 'd', '"dd', norkeymap_options);
	vim.keymap.set('n', 's', '"ss', norkeymap_options);
	vim.keymap.set('v', 's', '"ss', norkeymap_options);
	vim.keymap.set('n', 'c', '"cc', norkeymap_options);
	vim.keymap.set('v', 'c', '"cc', norkeymap_options);
	vim.g.mapleader = ' '
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', {});
	vim.keymap.set('n', '<leader>s', ':nohlsearch<CR>', {});
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	vim.keymap.set('n', '<leader>fc', builtin.commands, {})
end

return settings;
