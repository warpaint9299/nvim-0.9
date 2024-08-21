vim.g.mapleader = " "
vim.g.autoformat = true
local opt = vim.opt
opt.autowrite = true
opt.history = 10000
opt.laststatus = 0
opt.showtabline = 0
opt.tabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = true
opt.hlsearch = false
opt.showcmd = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = false
opt.smartcase = true
opt.autoindent = true
opt.wrapscan = true
opt.encoding = "utf-8"
opt.background = "dark"
opt.mousemodel = ""
opt.iskeyword = "@,48-57,_,192-255,-,>"
-- "unnamedplus"：使用系统的 "+ 剪切板"（即普通系统剪切板）进行复制/粘贴。
-- "unnamed"：使用系统的 "* 剪切板"（中键复制粘贴，通常在 X11 系统上有效）。
opt.clipboard:append({ "unnamed" })
