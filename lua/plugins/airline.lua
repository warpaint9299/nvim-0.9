return {
	"vim-airline/vim-airline",
	dependencies = {
		"vim-airline/vim-airline-themes",
	},
	config = function()
		vim.opt.laststatus = 0
		vim.opt.showtabline = 0
		vim.cmd([[
			let g:airline#extensions#tabline#enabled = 1
			let g:airline#extensions#tabline#left_sep = ' '
			let g:airline#extensions#tabline#left_alt_sep = ' '
			let g:airline#extensions#tabline#formatter = 'default'
			let g:airline#extensions#tabline#left_sep  = " "
			let g:airline#extensions#tabline#right_sep = ""
			let g:airline#extensions#tabline#show_close_button = 0
			let g:airline#extensions#tabline#show_tabs = 1
			let g:airline#extensions#tabline#show_tab_nr = 0
			let g:airline#extensions#tabline#ignore_bufadd_pat =
            \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
		]])
	end,
}
