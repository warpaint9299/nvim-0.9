return {
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline",
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
					message = {
						-- Messages shown by lsp servers
						enabled = true,
						view = "mini",
						opts = {},
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				messages = {
					-- NOTE: If you enable messages, then the cmdline is enabled automatically.
					-- This is a current Neovim limitation.
					enabled = true, -- enables the Noice messages UI
					view = "mini", -- default view for messages
					view_error = "notify", -- view for errors
					view_warn = "notify", -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
				},
			})
		end,
	},
	{
		"MaximilianLloyd/lazy-reload.nvim",
		opts = {
			command_name = "ReloadPlugin",
		},
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		config = function()
			vim.g.notify = 0
			require("garbage-day").setup({
				aggressive_mode = false,
				notifications = false,
				excluded_lsp_clients = { "null-ls" },
				retries = 4,
			})
			local opt = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<leader>ce", ":lua require('garbage-day.utils').stop_lsp()<CR>", opt)
			vim.api.nvim_set_keymap("n", "<leader>cs", ":lua require('garbage-day.utils').start_lsp()<CR>", opt)
		end,
	},
}
