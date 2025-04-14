return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "npm install",
		init = function()
			if vim.fn.executable("npx") then
				vim.g.mkdp_filetypes = { "markdown" }
			end
		end,
	},
	{
		"bullets-vim/bullets.vim",
		config = function()
			vim.cmd([[
			let g:bullets_enabled_file_types = [
				\ 'markdown',
				\ 'text',
				\ 'gitcommit',
				\ 'scratch'
				\]
			let g:bullets_enable_in_empty_buffers = 0 " default = 1
			let g:bullets_line_spacing = 1 " default = 1
			let g:bullets_auto_indent_after_colon = 1 " default = 1
			let g:bullets_max_alpha_characters = 2 " default = 2
			let g:bullets_outline_levels = ['ROM', 'ABC', 'num', 'abc', 'rom', 'std-', 'std*', 'std+']
			let g:bullets_nested_checkboxes = 1
			let g:bullets_checkbox_markers = 'X○◐●✓'
			let g:bullets_checkbox_partials_toggle = 1
			let g:bullets_pad_right = 1
			"let g:bullets_set_mappings = 0
			"let g:bullets_custom_mappings = [
			"	\ ['imap', '<cr>', '<Plug>(bullets-newline)'],
			"	\ ['inoremap', '<C-cr>', '<cr>'],
			"	\
			"	\ ['nmap', 'o', '<Plug>(bullets-newline)'],
			"	\
			"	\ ['vmap', 'gN', '<Plug>(bullets-renumber)'],
			"	\ ['nmap', 'gN', '<Plug>(bullets-renumber)'],
			"	\
			"	\ ['nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)'],
			"	\
			"	\ ['imap', '<C-t>', '<Plug>(bullets-demote)'],
			"	\ ['vmap', '>', '<Plug>(bullets-demote)'],
			"	\ ['imap', '<C-d>', '<Plug>(bullets-promote)'],
			"	\ ['vmap', '<', '<Plug>(bullets-promote)'],
			"	\ ]
			]])
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		config = function()
			require("render-markdown").setup({
				enabled = false,
				render_modes = { "n", "c", "t" },
				log_level = "error",
				log_runtime = false,
				file_types = { "markdown" },
				paragraph = {
					-- Turn on / off paragraph rendering.
					enabled = true,
					-- Additional modes to render paragraphs.
					render_modes = false,
					-- Amount of margin to add to the left of paragraphs.
					-- If a float < 1 is provided it is treated as a percentage of available window space.
					left_margin = 0,
					-- Minimum width to use for paragraphs.
					min_width = 0,
				},
				link = {
					-- Turn on / off inline link icon rendering.
					enabled = true,
				},
				code = {
					-- Turn on / off code block & inline code rendering.
					enabled = true,
					-- Additional modes to render code blocks.
					render_modes = false,
				},
				latex = {
					-- Turn on / off latex rendering.
					enabled = true,
					-- Additional modes to render latex.
					render_modes = false,
					-- Executable used to convert latex formula to rendered unicode.
					converter = "latex2text",
					-- Highlight for latex blocks.
					highlight = "RenderMarkdownMath",
					-- Determines where latex formula is rendered relative to block.
					-- | above | above latex block |
					-- | below | below latex block |
					position = "above",
					-- Number of empty lines above latex blocks.
					top_pad = 0,
					-- Number of empty lines below latex blocks.
					bottom_pad = 0,
				},
				on = {
					-- Called when plugin initially attaches to a buffer.
					attach = function() end,
					-- Called after plugin renders a buffer.
					render = function() end,
					-- Called after plugin clears a buffer.
					clear = function() end,
				},
				completions = {
					-- Settings for coq_nvim completions source
					coq = { enabled = false },
					-- Settings for in-process language server completions
					lsp = { enabled = false },
				},
				heading = {
					-- Turn on / off heading icon & background rendering.
					enabled = true,
					-- Additional modes to render headings.
					render_modes = false,
					-- Turn on / off any sign column related rendering.
					sign = true,
					-- Replaces '#+' of 'atx_h._marker'.
					-- Output is evaluated depending on the type.
					-- | function | `value(context)`              |
					-- | string[] | `cycle(value, context.level)` |
					icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
					signs = { "󰫎 " },
					-- Determines how icons fill the available space.
					-- | right   | '#'s are concealed and icon is appended to right side                          |
					-- | inline  | '#'s are concealed and icon is inlined on left side                            |
					-- | overlay | icon is left padded with spaces and inserted on left hiding any additional '#' |
					position = "overlay",
					-- Width of the heading background.
					-- | block | width of the heading text |
					-- | full  | full width of the window  |
					-- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
					width = "full",
				},
			})
		end,
	},
}
