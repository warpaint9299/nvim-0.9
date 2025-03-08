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
		"OXY2DEV/markview.nvim",
		lazy = false,
		config = function()
			local presets = require("markview.presets")
			require("markview").setup({
				experimental = {
					date_formats = {},
					date_time_formats = {},

					text_filetypes = {},
					read_chunk_size = 1000,
					link_open_alerts = false,
					file_open_command = "tabnew",

					list_empty_line_tolerance = 3,
				},
				preview = {
					enable = true,
					filetypes = { "md", "rmd", "quarto" },
					ignore_buftypes = { "nofile" },
					ignore_previews = {},

					modes = { "n", "no", "c" },
					hybrid_modes = {},
					debounce = 50,
					draw_range = { vim.o.lines, vim.o.lines },
					edit_range = { 1, 0 },

					callbacks = {},

					splitview_winopts = { split = "bottom" },
				},
				renderers = {},

				html = {
					enable = true,

					container_elements = {},
					headings = {},
					void_elements = {},
				},
				latex = {
					enable = true,

					blocks = {},
					commands = {},
					escapes = {},
					fonts = {},
					inlines = {},
					parenthesis = {},
					subscripts = {},
					superscripts = {},
					symbols = {},
					texts = {},
				},
				markdown = {
					enable = true,
					block_quotes = {},
					code_blocks = {},
					headings = presets.headings.slanted,
					horizontal_rules = {},
					list_items = {},
					metadata_plus = {},
					metadata_minus = {},
					tables = {},
				},
				markdown_inline = {
					enable = true,

					block_references = {},
					checkboxes = {},
					emails = {},
					embed_files = {},
					entities = {},
					escapes = {},
					footnotes = {},
					highlights = {},
					hyperlinks = {},
					images = {},
					inline_codes = {},
					internal_links = {},
					uri_autolinks = {},
				},
				typst = {
					enable = true,

					codes = {},
					escapes = {},
					headings = {},
					labels = {},
					list_items = {},
					math_blocks = {},
					math_spans = {},
					raw_blocks = {},
					raw_spans = {},
					reference_links = {},
					subscripts = {},
					superscript = {},
					symbols = {},
					terms = {},
					url_links = {},
				},
				yaml = {
					enable = true,

					properties = {},
				},
			})
		end,
	},
}
