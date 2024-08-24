return {
	"mattn/emmet-vim",
	config = function()
		vim.cmd([[
			let g:user_emmet_install_global = 0
			let g:user_emmet_mode='inv'
			" press key `<C-y>,` to expand emmet expression
			let g:user_emmet_leader_key='<C-y>' 
			autocmd FileType html,css EmmetInstall 
		]])
	end,
}
