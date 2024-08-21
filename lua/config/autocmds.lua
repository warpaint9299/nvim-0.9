local last_position = {}

local function save_cursor_position()
	local buf = vim.api.nvim_get_current_buf()
	if vim.api.nvim_buf_get_option(buf, "modifiable") and not vim.api.nvim_buf_get_option(buf, "filetype") == "" then
		local pos = vim.api.nvim_win_get_cursor(0)
		last_position[buf] = pos
	end
end

local function restore_cursor_position()
	local buf = vim.api.nvim_get_current_buf()
	local pos = last_position[buf]
	if pos then
		local line_count = vim.api.nvim_buf_line_count(buf)
		if pos[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, pos)
		end
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"asm",
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"html",
		"java",
		"javascript",
		"lua",
		"rust",
		"typescript",
		"vim",
		"xml",
		"yaml",
	},
	callback = function()
		-- r insert the star when typing <Enter> in Insert mode
		-- o insert the star when using "o" or "O" in Normal mode
		-- c break comment text according to 'textwidth'
		vim.opt.formatoptions:remove("r")
		vim.opt.formatoptions:remove("o")
		vim.opt.formatoptions:remove("c")
	end,
})
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
	callback = save_cursor_position,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		-- 确保光标恢复位置在文件末尾之前
		local buf = vim.api.nvim_get_current_buf()
		local last_pos = vim.api.nvim_buf_get_mark(buf, '"')
		if last_pos[1] > 0 and last_pos[1] <= vim.api.nvim_buf_line_count(buf) then
			vim.api.nvim_win_set_cursor(0, last_pos)
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = restore_cursor_position,
})

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
	float = {
		source = "always",
	},
})

-- local function show_diagnostics_on_hover()
-- 	local diagnostics = vim.diagnostic.get()
-- 	if diagnostics and #diagnostics > 0 then
-- 		vim.diagnostic.open_float(nil, {
-- 			focusable = false,
-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
-- 			border = "rounded",
-- 			source = "always",
-- 			prefix = " ",
-- 			scope = "cursor",
-- 		})
-- 	end
-- end
--
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	pattern = "*",
-- 	callback = show_diagnostics_on_hover,
-- })
--
-- vim.o.updatetime = 1000
