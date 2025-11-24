vim.schedule(function()
	vim.lsp.enable({ "zls" })
end)

vim.api.nvim_create_autocmd("BufWritePost", {
	buffer = 0,
	callback = function()
		vim.fn.system({
			"zig",
			"fmt",
			vim.api.nvim_buf_get_name(0),
		})
		vim.cmd("checktime")
	end,
})
