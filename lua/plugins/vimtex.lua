return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	tag = "v2.15", -- uncomment to pin to a specific release
	config = function()
		-- keys
		-- ,ll 启动编译或继续编译当前 LaTeX 文件。
		-- ,lk：中止编译。
		-- ,lv：查看输出的 PDF 文件，默认会使用你的系统 PDF 查看器。
		-- ,lo：打开 vimtex 状态窗口，显示编译信息。
		-- ,lc：清理编译生成的中间文件（如 .aux、.log 等）。
		-- VimTeX configuration goes here, e.g.
		vim.g.maplocalleader = ","
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
		vim.g.vimtex_quickfix_open_on_warning = 0
	end,
}
