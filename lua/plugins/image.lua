return {
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		keys = {
			-- suggested keymap
			{ "<leader>P", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
		config = function()
			require("img-clip").setup({
				default = {
					-- file and directory options
					dir_path = "assets", ---@type string
					extension = "png", ---@type string
					file_name = "%Y-%m-%d-%H-%M-%S", ---@type string
					use_absolute_path = false, ---@type boolean
					relative_to_current_file = false, ---@type boolean

					-- template options
					template = "$FILE_PATH", ---@type string
					url_encode_path = false, ---@type boolean
					relative_template_path = true, ---@type boolean
					use_cursor_in_template = true, ---@type boolean
					insert_mode_after_paste = true, ---@type boolean

					-- prompt options
					prompt_for_file_name = true, ---@type boolean
					show_dir_path_in_prompt = false, ---@type boolean

					-- base64 options
					max_base64_size = 10, ---@type number
					embed_image_as_base64 = false, ---@type boolean

					-- image options
					process_cmd = "", ---@type string
					copy_images = false, ---@type boolean
					download_images = true, ---@type boolean

					-- drag and drop options
					drag_and_drop = {
						enabled = true, ---@type boolean
						insert_mode = false, ---@type boolean
					},
				},

				-- filetype specific options
				filetypes = {
					markdown = {
						url_encode_path = true, ---@type boolean
						template = "![$CURSOR]($FILE_PATH)", ---@type string
						download_images = false, ---@type boolean
					},

					vimwiki = {
						url_encode_path = true, ---@type boolean
						template = "![$CURSOR]($FILE_PATH)", ---@type string
						download_images = false, ---@type boolean
					},

					html = {
						template = '<img src="$FILE_PATH" alt="$CURSOR">', ---@type string
					},

					tex = {
						relative_template_path = false, ---@type boolean
						template = [[
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
	]], ---@type string
					},

					typst = {
						template = [[
#figure(
  image("$FILE_PATH", width: 80%),
  caption: [$CURSOR],
) <fig-$LABEL>
	]], ---@type string
					},

					rst = {
						template = [[
.. image:: $FILE_PATH
   :alt: $CURSOR
   :width: 80%
	]], ---@type string
					},

					asciidoc = {
						template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]', ---@type string
					},

					org = {
						template = [=[
#+BEGIN_FIGURE
[[file:$FILE_PATH]]
#+CAPTION: $CURSOR
#+NAME: fig:$LABEL
#+END_FIGURE
	]=], ---@type string
					},
				},

				-- file, directory, and custom triggered options
				files = {}, ---@type table
				dirs = {}, ---@type table
				custom = {}, ---@type table
			})
		end,
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
		config = function()
			if vim.g.neovide then
				return
			end
			-- Put anything you want to happen only in Neovide here
			-- default config
			require("image").setup({
				backend = "kitty",
				processor = "magick_rock", -- or "magick_cli"
				integrations = {
					markdown = {
						enabled = true,
						clear_in_insert_mode = true,
						download_remote_images = true,
						only_render_image_at_cursor = true,
						floating_windows = false, -- if true, images will be rendered in floating markdown windows
						filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
					},
					neorg = {
						enabled = true,
						filetypes = { "norg" },
					},
					typst = {
						enabled = true,
						filetypes = { "typst" },
					},
					html = {
						enabled = false,
					},
					css = {
						enabled = false,
					},
				},
				max_width = nil,
				max_height = nil,
				max_width_window_percentage = nil,
				max_height_window_percentage = 50,
				window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
				window_overlap_clear_ft_ignore = {
					"cmp_menu",
					"cmp_docs",
					"snacks_notif",
					"scrollview",
					"scrollview_sign",
				},
				editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
				tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
			})
		end,
	},
}
