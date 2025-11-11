require("config.javascript").setup()

vim.schedule(function()
	vim.lsp.enable({ "tailwind_ls" })
end)
