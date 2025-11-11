vim.schedule(function()
	vim.lsp.enable("lua_ls")
end)

vim.api.nvim_create_autocmd("BufWritePost", {
	buffer = 0,
	callback = function()
		vim.fn.system({
			"stylua",
			"--search-parent-directories",
			vim.api.nvim_buf_get_name(0),
		})
		vim.cmd("checktime")
	end,
})
