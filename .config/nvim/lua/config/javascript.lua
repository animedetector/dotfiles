local M = {}

function M.setup()
	vim.schedule(function()
		vim.lsp.enable({ "ts_ls", "biome" })
	end)
	vim.api.nvim_create_autocmd("BufWritePost", {
		buffer = 0,
		callback = function()
			vim.fn.system({
				"biome",
				"check",
				"--write",
				vim.api.nvim_buf_get_name(0),
			})
			vim.cmd("checktime")
		end,
	})
end

return M
