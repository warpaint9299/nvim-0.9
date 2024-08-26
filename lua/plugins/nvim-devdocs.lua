return {
	"warpaint9299/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("nvim-devdocs").setup({
			dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
			hold_buf = true, -- keeping buffers open after closing.
			open_mode = "vsplit", -- 'split' (horizontal), 'vert' (vertical), and 'tab' for tab edit
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"django-5.1",
				"docker",
				"git",
				"go",
				"haproxy-2.9",
				"html",
				"http",
				"javascript",
				"kubectl",
				"kubernetes",
				"lua-5.4",
				"man",
				"markdown",
				"moment",
				"moment_timezone",
				"mongoose",
				"nginx",
				"nginx_lua_module",
				"node",
				"numpy-2.0",
				"openjdk-11",
				"pandas-2",
				"perl-5.38",
				"python-3.11",
				"react",
				"react_native",
				"redis",
				"requests",
				"rust",
				"spring_boot",
				"typescript",
				"vite",
				"vue-3",
			},
			telescope = {}, -- passed to the telescope picker
			float_win = { -- passed to nvim_open_win(), see :h api-floatwin
				relative = "editor",
				height = 25,
				width = 100,
				border = "rounded",
			},
			wrap = false, -- text wrap, only applies to floating window
			previewer_cmd = "glow", -- for example: "glow"
			cmd_args = { "-s", "dark", "-w", "80" }, -- example using glow: { "-s", "dark", "-w", "80" }
			cmd_ignore = {}, -- ignore cmd rendering for the listed docs
			picker_cmd = false, -- use cmd previewer in picker preview
			picker_cmd_args = {}, -- example using glow: { "-s", "dark", "-w", "50" }
			mappings = { -- keymaps for the doc buffer
				open_in_browser = "",
			},
		})
	end,
}
