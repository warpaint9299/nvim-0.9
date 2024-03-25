local translate = {}
translate = require("translate").setup({
	output = {
		float = {
			-- max_width of float window
			max_width = 40,
			-- max_height of float window
			max_height = 5,
			-- whether close float window on cursor move
			close_on_cursor_move = true,
			-- key to enter float window
			enter_key = "T",
		},
	},
	translate = {
		{
			-- use :TransToZH to start this job
			cmd = "TransToZH",
			-- shell command
			-- translate-shell is used here
			command = "trans",
			-- shell command args
			args = function(trans_source)
				-- trans_source is the text you want to translate
				return {
					"-b",
					"-e",
					"google",
					-- use proxy
					"-x",
					"127.0.0.1:7890",
					"-t",
					"zh-CN",
					-- you can filter translate source here
					trans_source,
				}
			end,
			-- how to get translate source
			-- selection | input | clipboard
			input = "selection",
			-- how to output translate result
			-- float_win | notify | clipboard | insert
			output = { "float_win" },
			-- format output
			---@type fun(output: string): string
			format = function(output)
				return output
			end,
		},
		{
			cmd = "TransToEN",
			command = "trans",
			args = function(trans_source)
				return {
					"-b",
					"-e",
					"google",
					-- use proxy
					"-x",
					"127.0.0.1:7890",
					"-t",
					"en",
					trans_source,
				}
			end,
			-- how to get translate source
			-- selection | input | clipboard
			input = "input",
			-- how to output translate result
			-- float_win | notify | clipboard | insert
			output = { "notify", "clipboard" },
		},
	},
})

vim.keymap.set("v", "<S-t>", "<cmd>TransToZH<CR>", { silent = true })
vim.keymap.set("n", "<C-t>", "<cmd>TransToEN<CR>")

return translate
