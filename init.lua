local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/?.lua"
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/modules/?.lua"
require("plugins").setup()
require("plugins").configure()
require("settings").generic()
require("settings").keymap()
