return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				indent = {
					char = { "¦", "┆" }, -- "|", "¦", "┆", "┊"
					smart_indent_cap = true,
					repeat_linebreak = false,
				},
				whitespace = {
					highlight = {
						"Whitespace",
						"NonText",
					},
					remove_blankline_trail = true,
				},
				scope = {
					enabled = false,
				},
				exclude = {
					filetypes = {
						"dashboard",
					},
				},
			})
		end,
	},
	{
		"folke/snacks.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = {
				enabled = true,
				replace_netrw = true,
			},
			indent = {
				---@class snacks.indent.Config
				---@field enabled? boolean
				indent = {
					priority = 1,
					enabled = true, -- enable indent guides
					char = "│",
					only_scope = false, -- only show indent guides of the scope
					only_current = false, -- only show indent guides in the current window
					hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
				},
				-- animate scopes. Enabled by default for Neovim >= 0.10
				-- Works on older versions but has to trigger redraws during animation.
				---@class snacks.indent.animate: snacks.animate.Config
				---@field enabled? boolean
				--- * out: animate outwards from the cursor
				--- * up: animate upwards from the cursor
				--- * down: animate downwards from the cursor
				--- * up_down: animate up or down based on the cursor position
				---@field style? "out"|"up_down"|"down"|"up"
				animate = {
					enabled = vim.fn.has("nvim-0.10") == 1,
					style = "out",
					easing = "linear",
					duration = {
						step = 20, -- ms per step
						total = 500, -- maximum duration
					},
				},
				---@class snacks.indent.Scope.Config: snacks.scope.Config
				scope = {
					enabled = true, -- enable highlighting the current scope
					priority = 200,
					char = "│",
					underline = false, -- underline the start of the scope
					only_current = false, -- only show scope in the current window
					hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
				},
				chunk = {
					-- when enabled, scopes will be rendered as chunks, except for the
					-- top-level scope which will be rendered as a scope.
					enabled = true,
					-- only show chunk scopes in the current window
					only_current = false,
					priority = 200,
					hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
					char = {
						-- corner_top = "┌",
						-- corner_bottom = "└",
						corner_top = "╭",
						corner_bottom = "╰",
						horizontal = "─",
						vertical = "│",
						arrow = ">",
					},
				},
				-- filter for buffers to enable indent guides
				filter = function(buf)
					return vim.g.snacks_indent ~= false
						and vim.b[buf].snacks_indent ~= false
						and vim.bo[buf].buftype == ""
				end,
			},
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			statuscolumn = { enabled = true },
			styles = {
				notification = {
					wo = { wrap = true }, -- Wrap notifications
				},
			},
		},
	-- stylua: ignore start
		keys = {
			-- Top Pickers & Explorer
			{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
			{ "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
			{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
			{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
			{ "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
			{ "<leader>e", function() Snacks.explorer(
				{
					replace_netrw = true,
					finder = "explorer",
					sort = { fields = { "sort" } },
					supports_live = true,
					tree = true,
					watch = true,
					diagnostics = true,
					diagnostics_open = false,
					git_status = true,
					git_status_open = false,
					git_untracked = true,
					follow_file = true,
					focus = "list",
					auto_close = false,
					jump = { close = false },
					-- layout = { preset = "sidebar", preview = false },
					-- to show the explorer to the right, add the below to
					-- your config under `opts.picker.sources.explorer`
					layout = { layout = { position = "right" } },
					formatters = {
						file = { filename_only = true },
						severity = { pos = "right" },
					},
					matcher = { sort_empty = false, fuzzy = false },
					config = function(opts)
						return require("snacks.picker.source.explorer").setup(opts)
					end,
					win = {
						input = { keys = { ["<Tab>"] = false } },
						list = {
							keys = {
								["<Tab>"] = false,
								["<BS>"] = "explorer_up",
								["l"] = "confirm",
								["h"] = "explorer_close", -- close directory
								["a"] = "explorer_add",
								["d"] = "explorer_del",
								["r"] = "explorer_rename",
								["c"] = "explorer_copy",
								["m"] = "explorer_move",
								["o"] = "explorer_open", -- open with system application
								["P"] = "toggle_preview",
								["y"] = { "explorer_yank", mode = { "n", "x" } },
								["p"] = "explorer_paste",
								["u"] = "explorer_update",
								["<c-c>"] = "tcd",
								["<leader>/"] = "picker_grep",
								["."] = "explorer_focus",
								["I"] = "toggle_ignored",
								["H"] = "toggle_hidden",
								["Z"] = "explorer_close_all",
								["]g"] = "explorer_git_next",
								["[g"] = "explorer_git_prev",
								["]d"] = "explorer_diagnostic_next",
								["[d"] = "explorer_diagnostic_prev",
								["]w"] = "explorer_warn_next",
								["[w"] = "explorer_warn_prev",
								["]e"] = "explorer_error_next",
								["[e"] = "explorer_error_prev",
							},
						},
					},
				}
			) end, desc = "File Explorer" },
			-- find
			{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
		    -- Grep
			{ "<leader>gb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
			{ "<leader>gB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
			{ "<leader>gg", function() Snacks.picker.grep() end, desc = "Grep" },
			{ "<leader>gw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
			-- search
			{ '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
			{ '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
			{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
			{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
			{ "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
			{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
			{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
			{ "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
			{ "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
			{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
			{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
			{ "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
			{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
			{ "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
			{ "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
			{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
			{ "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
			{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
			{ "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
			-- Other
			{ "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
			{ "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
			{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
			{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
			{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
			{ "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
			{ "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
			{ "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
		},
		-- stylua: ignore end
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>uT")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ub")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.indent():map("<leader>ug")
					Snacks.toggle.dim():map("<leader>Z")
				end,
			})
		end,
	},
}
