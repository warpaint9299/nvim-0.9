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
	pattern = { "text", "markdown" },
	callback = function()
		vim.opt.textwidth = 120
		vim.opt.colorcolumn = "-40,-20,120"
        vim.opt.spell = true
        vim.opt.spelllang = "en_us,cjk"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "markdown", "yaml", "toml", "json", "text" },
	callback = function()
		vim.opt.iskeyword = "@,48-57,192-255"
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "yaml", "toml", "json" },
	callback = function()
		local keyopts = { noremap = true, silent = true }
		vim.opt.relativenumber = false
		vim.opt.number = false
		vim.keymap.set("n", "<F2>", ":set number!<CR>:set relativenumber!<CR>", keyopts)
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "S", "s", "asm" },
	callback = function()
		vim.opt.iskeyword = "@,48-57,192-255"
		vim.opt.autoindent = false
		vim.opt.smartindent = false
		vim.opt.cindent = false
		vim.opt.indentexpr = ""
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
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

vim.api.nvim_create_autocmd({ "LspAttach", "InsertLeave" }, {
	callback = function()
		if not vim.lsp.inlay_hint.is_enabled() then
			vim.lsp.inlay_hint.enable(true)
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	callback = function()
		if vim.lsp.inlay_hint.is_enabled() then
			vim.lsp.inlay_hint.enable(false)
		end
	end,
})
