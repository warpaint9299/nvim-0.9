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
	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.ignorecase = false
	vim.opt.autoindent = true
	vim.opt.encoding = "utf-8"
	vim.opt.background = "dark"
	vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
	vim.opt.mousemodel = ""
	--	vim.opt.iskeyword = 'a-z'
	-- vim.cmd([[colorscheme tokyonight-moon]])
	vim.cmd([[ colorscheme gruvbox ]])
	vim.cmd([[
				augroup Miscellaneous
					autocmd!
					autocmd FileType markdown,text,* set laststatus=0
					autocmd InsertLeavePre *.md,*.text write
					autocmd BufReadPre * AirlineTheme base16_gruvbox_dark_hard
				augroup END
			]])
	vim.cmd([[
				augroup RememberCursorPosition
					autocmd!
					autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
				augroup END
			]])
	vim.cmd([[
				let g:term_buf = 0
				let g:term_win = 0
				function! TermToggle(height)
					if win_gotoid(g:term_win)
						hide
					else
						botright new
						exec "resize " . a:height
						try
							exec "buffer " . g:term_buf
						catch
							call termopen($SHELL, {"detach": 0})
							let g:term_buf = bufnr("")
							set nonumber
							set norelativenumber
							set signcolumn=no
						endtry
						startinsert!
						let g:term_win = win_getid()
					endif
				endfunction
				" Toggle terminal on/off (neovim)
				nnoremap <A-t> :call TermToggle(12)<CR>
				inoremap <A-t> <Esc>:call TermToggle(12)<CR>
				tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

				" Terminal go back to normal mode
				tnoremap <Esc> <C-\><C-n>
				tnoremap :q! <C-\><C-n>:q!<CR>
			]])
end

function settings.keymap()
	local norkeymap_options = { noremap = true, silent = true }
	vim.keymap.set("i", "jk", "<Esc>", nokeymap_options)
	vim.keymap.set("i", "<UP>", "<NOP>", nokeymap_options)
	vim.keymap.set("i", "<DOWN>", "<NOP>", nokeymap_options)
	vim.keymap.set("i", "<LEFT>", "<NOP>", nokeymap_options)
	vim.keymap.set("i", "<RIGHT>", "<NOP>", nokeymap_options)
	vim.keymap.set("i", "<C-h>", "<LEFT>", nokeymap_options)
	vim.keymap.set("i", "<C-l>", "<RIGHT>", nokeymap_options)
	vim.keymap.set("i", "<C-j>", "<DOWN>", nokeymap_options)
	vim.keymap.set("i", "<C-k>", "<UP>", nokeymap_options)
	-- keys of split window
	vim.keymap.set("n", "sp", ":split", {})
	vim.keymap.set("n", "vsp", ":vertical split", {})
	vim.keymap.set("n", "<A-UP>", ":horizontal resize +5<CR>", norkeymap_options)
	vim.keymap.set("n", "<A-DOWN>", ":horizontal resize -5<CR>", norkeymap_options)
	vim.keymap.set("n", "<A-RIGHT>", ":vertical resize -10<CR>", norkeymap_options)
	vim.keymap.set("n", "<A-LEFT>", ":vertical resize +10<CR>", norkeymap_options)
	vim.keymap.set(
		"n",
		"<C-UP>",
		':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:topleft split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
		norkeymap_options
	)
	vim.keymap.set(
		"n",
		"<C-DOWN>",
		':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:botright split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
		norkeymap_options
	)
	vim.keymap.set(
		"n",
		"<C-LEFT>",
		':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:vertical topleft split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
		norkrrmap_options
	)
	vim.keymap.set(
		"n",
		"<C-RIGHT>",
		':let @r=line(".")<CR>:let @c=col(".")<CR>:let @p=@%<CR>:close<CR>:vertical botright split <C-r>p<CR>:<C-r>r<CR>:normal <C-r>c|<CR>',
		norkeymap_options
	)
	vim.keymap.set("n", "<S-UP>", ":topleft split<CR>", norkeymap_options)
	vim.keymap.set("n", "<S-DOWN>", ":botright split<CR>", norkeymap_options)
	vim.keymap.set("n", "<S-LEFT>", ":vertical topleft split<CR>", norkeymap_options)
	vim.keymap.set("n", "<S-RIGHT>", ":vertical botright split<CR>", norkeymap_options)
	vim.keymap.set("n", "<S-c>", ":close<CR>", norkeymap_options)
	vim.keymap.set("v", "<C-c>", 'y"*', norkeymap_options)
	-- reset default register of keys to avoid overwrite system clipboard
	vim.keymap.set({ "n", "v" }, "x", '"xx', norkeymap_options)
	vim.keymap.set({ "n", "v" }, "d", '"dd', norkeymap_options)
	vim.keymap.set({ "n", "v" }, "s", '"ss', norkeymap_options)
	vim.keymap.set({ "n", "v" }, "c", '"cc', norkeymap_options)
	vim.keymap.set({ "n", "v" }, "px", '"xp', norkeymap_options)
	vim.keymap.set({ "n", "v" }, "pd", '"dp', norkeymap_options)
	vim.keymap.set({ "n", "v" }, "ps", '"sp', norkeymap_options)
	vim.keymap.set({ "n", "v" }, "pc", '"cp', norkeymap_options)
	vim.g.mapleader = " "
	vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", norkeymap_options)
	vim.keymap.set("n", "<leader>ss", ":SymbolsOutline<CR>", norkeymap_options)
	vim.keymap.set("n", "<leader>f", ":Format<CR>", norkeymap_options)
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		end,
	})
end

return settings
