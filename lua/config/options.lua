vim.env.TERMINAL = "st"
vim.g.mapleader = " "
vim.g.autoformat = true
vim.opt.autowrite = true
vim.opt.history = 10000
vim.opt.laststatus = 0
vim.opt.showtabline = 0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.hlsearch = false
vim.opt.showcmd = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.wrapscan = true
vim.opt.encoding = "utf-8"
vim.opt.background = "dark"
vim.opt.mousemodel = ""
vim.opt.iskeyword = "@,48-57,_,192-255,-,>"
vim.opt.clipboard:append({ "unnamed" })

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
