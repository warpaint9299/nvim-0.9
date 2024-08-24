return {
	"mattn/emmet-vim",
	config = function()
		-- key: `<C-y>,`
		vim.g.user_emmet_mode = "inv"
		vim.cmd([[ autocmd FileType html,css EmmetInstall ]])
		vim.g.user_emmet_settings = {
			indent_blockelement = 1,
		}
	end,
}
