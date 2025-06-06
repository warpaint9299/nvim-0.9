return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"jay-babu/mason-nvim-dap.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"nvim-neotest/nvim-nio",
			"jbyuki/one-small-step-for-vimkind",
		},
		config = function()
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
			)
			-- stylua: ignore start
			vim.keymap.set("n", "<F5>", ":DapContinue<CR>", { noremap = true, silent = true, desc = "DapContinue" })
			vim.keymap.set( "n", "<leader>o", ":DapStepOver<CR>", { noremap = true, silent = true, desc = "DapStepOver" })
			vim.keymap.set( "n", "<leader>i", ":DapStepInto<CR>", { noremap = true, silent = true, desc = "DapStepInto" })
			vim.keymap.set("n", "<leader>O", ":DapStepOut<CR>", { noremap = true, silent = true, desc = "DapStepOut" })
			vim.keymap.set( "n", "<leader>b", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true, desc = "DapToggleBreakpoint" })
			vim.keymap.set("n", "<F7>", function() require("dapui").toggle() end, { noremap = true, desc = "DapUIToggle" })
			vim.keymap.set("n", "<F9>", function() local args = { width = 80, enter = true }
				local element =
					vim.fn.confirm("Which element do you need to float?", "&Consle\n&Scopes\ns&Tacks\n&Watches", 2)
				if element == 1 then
					require("dapui").float_element("console", args)
				elseif element == 2 then
					require("dapui").float_element("scopes", args)
				elseif element == 3 then
					require("dapui").float_element("stacks", args)
				elseif element == 4 then
					require("dapui").float_element("watches", args)
				end
			end, { noremap = true, desc = "FloatDapElement" })
			-- stylua: ignore end

			local dap, dapui, dapmason = require("dap"), require("dapui"), require("mason-nvim-dap")

			dapui.setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "watches",
								size = 0.25,
							},
						},
						position = "left",
						size = 30,
					},
					{
						elements = {
							{
								id = "repl",
								size = 0.7,
							},
							{
								id = "console",
								size = 0.3,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
				mappings = {
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})
			dapmason.setup({})

			dap.listeners.before.attach.dapui_config = function()
				vim.opt.laststatus = 3
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				vim.opt.laststatus = 3
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			dap.set_log_level("INFO")

			-- Shell
			dap.adapters.bashdb = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
				name = "bashdb",
			}
			dap.configurations.sh = {
				{
					type = "bashdb",
					request = "launch",
					name = "Launch file",
					showDebugOutput = true,
					pathBashdb = vim.fn.stdpath("data")
						.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
					pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
					trace = true,
					file = "${file}",
					program = "${file}",
					cwd = "${workspaceFolder}",
					pathCat = "cat",
					pathBash = "/bin/bash",
					pathMkfifo = "mkfifo",
					pathPkill = "pkill",
					args = {},
					env = {},
					terminalKind = "integrated",
				},
			}

			-- Lua
			-- dap.adapters["local-lua"] = {
			-- 	type = "executable",
			-- 	command = "node",
			-- 	args = {
			-- 		vim.fn.stdpath("data")
			-- 			.. "/mason/packages/local-lua-debugger-vscode/extension/extension/debugAdapter.js",
			-- 	},
			-- 	enrich_config = function(config, on_config)
			-- 		if not config["extensionPath"] then
			-- 			local c = vim.deepcopy(config)
			-- 			-- 💀 If this is missing or wrong you'll see
			-- 			-- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
			-- 			c.extensionPath = vim.fn.stdpath("data")
			-- 				.. "/mason/packages/local-lua-debugger-vscode/extension"
			-- 			on_config(c)
			-- 		else
			-- 			on_config(config)
			-- 		end
			-- 	end,
			-- }
			-- dap.configurations.lua = {
			-- 	{
			-- 		name = "Current file (local-lua-dbg, lua)",
			-- 		type = "local-lua",
			-- 		request = "launch",
			-- 		cwd = "${workspaceFolder}",
			-- 		program = {
			-- 			lua = "lua",
			-- 			file = "${file}",
			-- 		},
			-- 		verbose = true,
			-- 		args = {},
			-- 	},
			-- }

			dap.adapters.nlua = function(callback, config)
				callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
			end

			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

			vim.keymap.set("n", "<leader>dl", function()
				require("osv").launch({ port = 8086 })
			end, { noremap = true, desc = 'require("osv").launch()' })
			vim.keymap.set("n", "<leader>dw", function()
				local widgets = require("dap.ui.widgets")
				widgets.hover()
			end, { noremap = true, desc = 'require("dap.ui.widgets").hover()' })

			-- C / Cpp / Rust
			dap.adapters.lldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
					args = { "--port", "${port}" },
					detached = function()
						if vim.fn.has("win32") == 1 then
							return false
						else
							return true
						end
					end,
				},
			}
			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function() -- Ask the user what executable wants to debug
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- Python
			dap.adapters.python = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
				},
			}

			-- Go
			-- Requires:
			-- * You have initialized your module with 'go mod init module_name'.
			-- * You :cd your project before running DAP.
			dap.adapters.delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}
			dap.configurations.go = {
				{
					type = "delve",
					name = "Compile module and debug this file",
					request = "launch",
					program = "./${relativeFileDirname}",
				},
				{
					type = "delve",
					name = "Compile module and debug this file (test)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}

			-- Kotlin
			-- Kotlin projects have very weak project structure conventions.
			-- You must manually specify what the project root and main class are.
			dap.adapters.kotlin = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/kotlin-debug-adapter",
			}
			dap.configurations.kotlin = {
				{
					type = "kotlin",
					request = "launch",
					name = "Launch kotlin program",
					projectRoot = "${workspaceFolder}/app", -- ensure this is correct
					mainClass = "AppKt", -- ensure this is correct
				},
			}
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
				--- A callback that determines how a variable is displayed or whether it should be omitted
				--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
				--- @param buf number
				--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
				--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
				--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
				--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
				display_callback = function(variable, buf, stackframe, node, options)
					-- by default, strip out new line characters
					if options.virt_text_pos == "inline" then
						return " = " .. variable.value:gsub("%s+", " ")
					else
						return variable.name .. " = " .. variable.value:gsub("%s+", " ")
					end
				end,
				-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
				virt_text_pos = "eol",

				-- experimental features:
				all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
				-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
			})
		end,
	},
}
