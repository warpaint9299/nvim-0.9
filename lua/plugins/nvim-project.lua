return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			"~/Workspace/*",
			"~/Documents/Notes/*",
			"~/Documents/Notes/books/*",
			"~/Documents/Notes/programming/*",
		},
		-- Path to store history and sessions
		datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
		-- Load the most recent session on startup if not in the project directory
		last_session_on_startup = false,
		dashboard_mode = false,
		session_manager_opts = {
			autosave_ignore_dirs = {
				vim.fn.expand("~"), -- don't create a session for $HOME/
				"/tmp",
			},
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		vim.api.nvim_set_keymap(
			"n",
			"<leader>fp",
			":Telescope neovim-project discover<CR>",
			{ noremap = true, silent = true }
		)
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = true,
	priority = 100,
}
