return {
	"warpaint9299/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local original_notify = vim.notify
		vim.notify = function(msg, ...)
			if msg:match("[nvim-devdocs] Plugin initialized") then
				return
			end
			original_notify(msg, ...)
		end

		require("nvim-devdocs").setup({
			dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
			hold_buf = false, -- keeping buffers open after closing.
			open_mode = "vsplit", -- 'split' (horizontal), 'vert' (vertical), and 'tab' for tab edit
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"docker",
				"dom",
				"git",
				"go",
				"html",
				"http",
				"javascript",
				"lua-5.4",
				"markdown",
				"nginx",
				"nginx_lua_module",
				"node",
				"python-3.11",
				"requests",
				"rust",
				"typescript",
			},
			filetypes = {
				-- extends the filetype to docs mappings used by the `DevdocsOpenCurrent` command, the version doesn't have to be specified
				-- scss = "sass",
				bash = "bash",
				c = "c",
				cpp = { "c", "cpp" },
				css = "css",
				go = "go",
				html = { "dom", "html" },
				java = { "openjdk", "spring_boot" },
				javascript = { "dom", "http", "javascript", "node", "vite" },
				javascriptreact = { "dom", "http", "javascript", "node", "react", "react_native", "vite" },
				lua = "lua",
				python = { "django", "http", "numpy", "python", "pandas", "requests" },
				rust = "rust",
				typescript = { "dom", "http", "node", "typescript", "vite" },
				typescriptrect = { "dom", "http", "node", "typescript", "react", "react_native", "vite" },
			},
			telescope = {}, -- passed to the telescope picker
			float_win = { -- passed to nvim_open_win(), see :h api-floatwin
				relative = "editor",
				height = 25,
				width = 100,
				border = "rounded",
			},
			wrap = false, -- text wrap, only applies to floating window
			previewer_cmd = nil, -- for example: "glow"
			cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "80" }
			cmd_ignore = {}, -- ignore cmd rendering for the listed docs
			picker_cmd = false, -- use cmd previewer in picker preview
			picker_cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "50" }
			mappings = { -- keymaps for the doc buffer
				open_in_browser = "",
			},
		})
	end,
}
