vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.lsp.config("*", { root_markers = { ".git" } })

vim.diagnostic.config({ virtual_text = { prefix = ">", spacing = 4 } })

local opt = vim.opt

opt.shortmess:append({ I = true })
opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.inccommand = "split"
