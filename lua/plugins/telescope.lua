return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"SalOrak/whaler",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")
			telescope.setup({
				defaults = {
					initial_mode = "normal",
					layout_strategy = "horizontal",
					layout_config = {
						preview_width = 0.6,
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					-- Default configuration for telescope goes here:
					-- config_key = value,
					mappings = {
						i = {
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
						},
						n = {
							["q"] = actions.close,
							["/"] = function()
								-- stylua: ignore
								vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes("i", true, false, true), "n", false)
							end,
							["<C-d>"] = function(prompt_bufnr)
								local selection = action_state.get_selected_entry()
								if selection and selection.bufnr then
									-- Delete the buffer; force deletion if needed
									vim.api.nvim_buf_delete(selection.bufnr, { force = true })
									actions.close(prompt_bufnr)
								end
							end,
							["<Tab>"] = actions.move_selection_next,
							["<S-Tab>"] = actions.move_selection_previous,
						},
					},
				},
				pickers = {},
				extensions = {
					whaler = {
						-- Whaler configuration
						directories = {
							{ path = "~/Workspace", alias = "Workspace" },
							{ path = "~/.config/nvim", alias = "Nvim-Config" },
						},
						-- You may also add directories that will not be searched for subdirectories
						oneoff_directories = {
							{ path = "~/.dotfiles/.dwm", alias = "DWM" },
						},
						auto_cwd = true,
						auto_file_explorer = true,
						file_explorer_config = {
							plugin_name = "ranger-nvim",
							command = "Ranger",
						},
						theme = { -- Telescope theme default Whaler options.
							results_title = false,
							layout_strategy = "horizontal",
							previewer = false,
							layout_config = {
								height = 0.8,
								width = 0.8,
							},
							sorting_strategy = "ascending",
							border = true,
						},
					},
				},
			})
		-- stylua: ignore start
		-- Search
		vim.keymap.set("n", "<leader>sp", telescope.extensions.whaler.whaler, { noremap = true, desc = "Telescope Open Project" })
		vim.keymap.set("n", "<leader>s/", builtin.search_history, { noremap = true, desc = "Find Search History" })
		vim.keymap.set("n", "<leader>sa", builtin.autocommands, {  noremap = true, desc = "Find Autocommands" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, {  noremap = true, desc = "Find Buffers" })
		vim.keymap.set("n", "<leader>sc", builtin.command_history, {  noremap = true, desc = "Find Command History" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, {  noremap = true, desc = "Find Files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, {  noremap = true, desc = "Telescope Grep" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, {  noremap = true, desc = "Find Help" })
		vim.keymap.set("n", "<leader>sH", builtin.highlights, {  noremap = true, desc = "Find Highlights" })
		vim.keymap.set("n", "<leader>sj", builtin.jumplist, {  noremap = true, desc = "Find Jumps" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, {  noremap = true, desc = "Find Keymaps" })
		vim.keymap.set("n", "<leader>sm", builtin.man_pages, {  noremap = true, desc = "Find Man pages" })
		vim.keymap.set("n", "<leader>sr", builtin.registers, {  noremap = true, desc = "Find Registers" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, {  noremap = true, desc = "Find Visual selection or word"})
		-- Lsp
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {  noremap = true, desc = "Telescope Goto Definition" })
		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, {  noremap = true, desc = "Telescope Goto Implementation" })
		vim.keymap.set("n", "<leader>gI", builtin.lsp_incoming_calls, {  noremap = true, desc = "Telescope Goto Incoming Calls" })
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, {  noremap = true, desc = "Telescope Goto References" })
		vim.keymap.set("n", "<leader>gy", builtin.lsp_type_definitions, {  noremap = true, desc = "Telescope Goto T[y]pe Definition" })
			-- stylua: ignore end
		end,
	},
	{
		"kelly-lin/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({
				enable_cmds = true,
				replace_netrw = true,
				ui = {
					-- "none": No border.
					-- "single": A single line box.
					-- "double": A double line box.
					-- "rounded": Like "single", but with rounded corners ("╭" etc.).
					-- "solid": Adds padding by a single whitespace cell.
					-- "shadow": A drop shadow effect by blending with the background.
					border = "double",
					height = 0.7,
					width = 0.7,
					x = 0.5,
					y = 0.5,
				},
			})
			-- stylua: ignore
			vim.api.nvim_set_keymap("n", "<leader>e", ":Ranger<CR>", { noremap = true, desc = "Ranger File Explorer" })
		end,
	},
}
