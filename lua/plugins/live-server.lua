return {
	"aurum77/live-server.nvim",
	event = "LspAttach",
	config = function()
		local status_ok, live_server = pcall(require, "live_server")
		if not status_ok then
			return
		end

		live_server.setup({
			math.randomseed(os.time()),
			port = math.random(30000, 60000),
			browser_command = "", -- Empty string starts up with default browser
			quiet = false,
			no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
			install_path = vim.fn.stdpath("state") .. "/live-server/",
		})

		require("live_server.util").install()
	end,
	cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
}
