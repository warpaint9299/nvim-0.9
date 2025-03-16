return {
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			stiffness = 0.8, -- 0.6      [0, 1]
			trailing_stiffness = 0.5, -- 0.3      [0, 1]
			distance_stop_animating = 0.5, -- 0.1      > 0
			hide_target_hack = true,
			cursor_color = "#e0e0e0",
			-- Smear cursor when switching buffers or windows.
			smear_between_buffers = true,

			-- Smear cursor when moving within line or to neighbor lines.
			-- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
			smear_between_neighbor_lines = true,

			-- Draw the smear in buffer space instead of screen space when scrolling
			scroll_buffer_space = true,

			-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
			-- Smears will blend better on all backgrounds.
			legacy_computing_symbols_support = true,

			-- Smear cursor in insert mode.
			-- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
			smear_insert_mode = true,
		},
	},
	{
		"gen740/SmoothCursor.nvim",
		config = function()
			vim.api.nvim_set_hl(0, "SmoothCursor", { bg = nil, fg = "#b8bb26" })
			require("smoothcursor").setup({
				type = "default", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

				cursor = "❯", -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
				texthl = "SmoothCursor", -- Highlight group. Default is { bg = nil, fg = "#b8bb26" }. Disabled in fancy mode.
				linehl = nil, -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

				fancy = {
					enable = false, -- enable fancy mode
					head = { cursor = "❯", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
					body = {
						{ cursor = "󰝥", texthl = "SmoothCursorRed" },
						{ cursor = "󰝥", texthl = "SmoothCursorOrange" },
						{ cursor = "●", texthl = "SmoothCursorYellow" },
						{ cursor = "●", texthl = "SmoothCursorGreen" },
						{ cursor = "•", texthl = "SmoothCursorAqua" },
						{ cursor = ".", texthl = "SmoothCursorBlue" },
						{ cursor = ".", texthl = "SmoothCursorPurple" },
					},
					tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
				},

				matrix = { -- Loaded when 'type' is set to "matrix"
					head = {
						-- Picks a random character from this list for the cursor text
						cursor = require("smoothcursor.matrix_chars"),
						-- Picks a random highlight from this list for the cursor text
						texthl = {
							"SmoothCursor",
						},
						linehl = nil, -- No line highlight for the head
					},
					body = {
						length = 6, -- Specifies the length of the cursor body
						-- Picks a random character from this list for the cursor body text
						cursor = require("smoothcursor.matrix_chars"),
						-- Picks a random highlight from this list for each segment of the cursor body
						texthl = {
							"SmoothCursorGreen",
						},
					},
					tail = {
						-- Picks a random character from this list for the cursor tail (if any)
						cursor = nil,
						-- Picks a random highlight from this list for the cursor tail
						texthl = {
							"SmoothCursor",
						},
					},
					unstop = false, -- Determines if the cursor should stop or not (false means it will stop)
				},

				autostart = true, -- Automatically start SmoothCursor
				always_redraw = true, -- Redraw the screen on each update
				flyin_effect = nil, -- Choose "bottom" or "top" for flying effect
				speed = 25, -- Max speed is 100 to stick with your current position
				intervals = 35, -- Update intervals in milliseconds
				priority = 10, -- Set marker priority
				timeout = 3000, -- Timeout for animations in milliseconds
				threshold = 3, -- Animate only if cursor moves more than this many lines
				max_threshold = nil, -- If you move more than this many lines, don't animate (if `nil`, deactivate check)
				disable_float_win = false, -- Disable in floating windows
				enabled_filetypes = nil, -- Enable only for specific file types, e.g., { "lua", "vim" }
				disabled_filetypes = nil, -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
				-- Show the position of the latest input mode positions.
				-- A value of "enter" means the position will be updated when entering the mode.
				-- A value of "leave" means the position will be updated when leaving the mode.
				-- `nil` = disabled
				show_last_positions = nil,
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
