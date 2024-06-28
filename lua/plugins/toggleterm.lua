return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup()
		vim.api.nvim_create_user_command("Term", function()
			vim.cmd("ToggleTerm")
		end, {})
	end,
}
