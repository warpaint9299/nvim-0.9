return {
	{
		"sontungexpt/stcursorword",
		event = "VeryLazy",
		config = function()
			-- default configuration
			require("stcursorword").setup({
				max_word_length = 100, -- if cursorword length > max_word_length then not highlight
				min_word_length = 2, -- if cursorword length < min_word_length then not highlight
				excluded = {
					filetypes = {
						"TelescopePrompt",
					},
					buftypes = {
						-- "nofile",
						-- "terminal",
					},
					patterns = { -- the pattern to match with the file path
						-- "%.png$",
						-- "%.jpg$",
						-- "%.jpeg$",
						-- "%.pdf$",
						-- "%.zip$",
						-- "%.tar$",
						-- "%.tar%.gz$",
						-- "%.tar%.xz$",
						-- "%.tar%.bz2$",
						-- "%.rar$",
						-- "%.7z$",
						-- "%.mp3$",
						-- "%.mp4$",
					},
				},
				highlight = {
					underline = true,
					fg = nil,
					bg = nil,
				},
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		version = "*",
		config = function()
			if vim.g.neovide then
				return
			end
			require("neoscroll").setup({
				mappings = { -- Keys to be mapped to their corresponding default scrolling animation
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					"<C-y>",
					"<C-e>",
					"zt",
					"zz",
					"zb",
				},
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing = "linear", -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
			})
			local neoscroll = require("neoscroll")
			vim.keymap.set({ "n", "v", "x" }, "<ScrollWheelUp>", function()
				neoscroll.scroll(-0.2, { move_cursor = false, duration = 100 })
			end)
			vim.keymap.set({ "n", "v", "x" }, "<ScrollWheelDown>", function()
				neoscroll.scroll(0.2, { move_cursor = false, duration = 100 })
			end)
		end,
	},
}
