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
opt.clipboard:append({ "unnamed", "unnamedplus" })
-- r insert the star when typing <Enter> in Insert mode
-- o insert the star when using "o" or "O" in Normal mode
-- c break comment text according to 'textwidth'
opt.formatoptions:remove("o")
