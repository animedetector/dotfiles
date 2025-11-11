vim.schedule(function()
	vim.lsp.enable({ "ruff", "ty" })
end)

vim.api.nvim_create_autocmd("BufWritePost", {
	buffer = 0,
	callback = function()
		vim.fn.system({
			"ruff",
			"check",
			"--select",
			"I",
			"--fix",
			vim.api.nvim_buf_get_name(0),
		})
		vim.fn.system({
			"ruff",
			"format",
			vim.api.nvim_buf_get_name(0),
		})
		vim.cmd("checktime")
	end,
})
