return {
	"vim-airline/vim-airline",
	dependencies = {
		"vim-airline/vim-airline-themes",
	},
	config = function()
		vim.opt.laststatus = 0
		vim.opt.showtabline = 0
		vim.cmd([[
			let g:airline_theme='base16_solarized'
			let g:airline_left_sep = ""
			let g:airline_right_sep = ""
			let g:airline_skip_empty_sections = 1
			let g:airline_section_b = '%{&fileformat}'
			let g:airline_section_x = '%p%%'
			let g:airline_section_y = '%{&fileencoding}'
			let g:airline_section_z = '%l/%L, %v'
			let g:airline#extensions#nvimlsp#enabled = 1
			let g:airline#extensions#nvimlsp#error_symbol = ' '
			let g:airline#extensions#nvimlsp#warning_symbol = ' '
			let g:airline#extensions#nvimlsp#show_line_numbers = 0
			let g:airline#extensions#tabline#enabled = 1
			let g:airline#extensions#tabline#left_sep = ' '
			let g:airline#extensions#tabline#left_alt_sep = ' '
			let g:airline#extensions#tabline#formatter = 'default'
			let g:airline#extensions#tabline#left_sep = ""
			let g:airline#extensions#tabline#right_sep = ""
			let g:airline#extensions#tabline#show_close_button = 0
			let g:airline#extensions#tabline#show_tabs = 1
			let g:airline#extensions#tabline#show_tab_nr = 0
			let g:airline#extensions#tabline#ignore_bufadd_pat =
            \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
			let g:airline#extensions#default#layout = [
				\ [ 'a', 'b', 'c' ],
				\ [ 'x', 'y', 'z', 'error' ]
				\ ]
		]])

		if vim.g.neovide then
			vim.opt.laststatus = 2
			vim.opt.showtabline = 2
			vim.cmd([[
				let g:airline_left_sep = ""
				let g:airline_right_sep = ""
				let g:airline#extensions#tabline#left_sep = ""
				let g:airline#extensions#tabline#right_sep = ""
			]])
		end

		function ToggleLastStatus()
			if vim.opt.laststatus:get() == 0 then
				vim.opt.laststatus = 2
			else
				vim.opt.laststatus = 0
			end
		end
		vim.api.nvim_set_keymap("n", "<F2>", ":lua ToggleLastStatus()<CR>", { noremap = true, silent = true })
	end,
}
