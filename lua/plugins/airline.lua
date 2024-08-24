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
			let g:airline_section_z = ' '
			let g:airline#extensions#nvimlsp#enabled = 1
			let g:airline#extensions#nvimlsp#error_symbol = ' '
			let g:airline#extensions#nvimlsp#warning_symbol = ' '
			let g:airline#extensions#nvimlsp#show_line_numbers = 0
			let g:airline#extensions#tabline#enabled = 1
			let g:airline#extensions#tabline#left_sep = ' '
			let g:airline#extensions#tabline#left_alt_sep = ' '
			let g:airline#extensions#tabline#formatter = 'default'
			let g:airline#extensions#tabline#left_sep = " "
			let g:airline#extensions#tabline#right_sep = ""
			let g:airline#extensions#tabline#show_close_button = 0
			let g:airline#extensions#tabline#show_tabs = 1
			let g:airline#extensions#tabline#show_tab_nr = 0
			let g:airline#extensions#tabline#ignore_bufadd_pat =
            \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
			let g:airline#extensions#default#layout = [
				\ [ 'a', 'error', 'b', 'c' ],
				\ [ 'x', 'y' ]
				\ ]
		]])
	end,
}