return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
					function()
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				c = {
					function()
						return {
							exe = "clang-format",
							args = { util.escape_path(util.get_current_buffer_file_path()) },
							stdin = true,
						}
					end,
				},
				tex = {
					function()
						return { exe = "latexindent -", stdin = true }
					end,
				},
				java = {
					function()
						return {
							exe = "google-java-format",
							args = {
								"--aosp",
								util.escape_path(util.get_current_buffer_file_path()),
								"--replace",
							},
							stdin = true,
						}
					end,
				},
				rust = {
					function()
						return {
							exe = "rustfmt",
							args = { "--edition 2021" },
							stdin = true,
						}
					end,
				},
				typescript = {
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width 2",
								"--bracket-spacing",
								"--bracket-same-line",
								"--arrow-parens always",
								"--prose-wrap preserve",
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				typescriptrect = {
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width 2",
								"--bracket-spacing",
								"--bracket-same-line",
								"--arrow-parens always",
								"--prose-wrap preserve",
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				json = {
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width 2",
								"--print-width 7",
								"--bracket-spacing",
								"--bracket-same-line",
								"--arrow-parens always",
								"--prose-wrap preserve",
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				yaml = {
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width 2",
								"--bracket-spacing",
								"--bracket-same-line",
								"--arrow-parens always",
								"--prose-wrap preserve",
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				markdown = {
					function()
						return {
							exe = "prettier",
							args = {
								"--tab-width 2",
								"--print-width 7",
								"--bracket-spacing",
								"--bracket-same-line",
								"--arrow-parens always",
								"--prose-wrap preserve",
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
