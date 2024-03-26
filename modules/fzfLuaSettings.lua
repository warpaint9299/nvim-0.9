local fzf = require("fzf-lua").setup({})
vim.keymap.set("n", "<S-e>", ":lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<S-f>", ":lua require('fzf-lua').lgrep_curbuf()<CR>", { silent = true })
vim.keymap.set("n", "<S-m>", ":lua require('fzf-lua').lsp_finder()<CR>", { silent = true })
vim.keymap.set("n", "<S-b>", ":lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set("n", "<S-d>", ":lua require('fzf-lua').lsp_document_diagnostics()<CR>", { silent = true })
vim.keymap.set("n", "<S-k>", ":lua require('fzf-lua').keymaps()<CR>", { silent = true })
return fzf
