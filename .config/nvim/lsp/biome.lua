---@type vim.lsp.Config
return {
	cmd = function(dispatchers, config)
		local cmd = "biome"
		local project_cmd = (config or {}).root_dir
			and config.root_dir .. "/node_modules/.bin/biome"
		if project_cmd and vim.fn.executable(project_cmd) == 1 then
			cmd = project_cmd
		end
		return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
	end,
	filetypes = {
		"css",
		"html",
		"javascript",
		"json",
		"typescript",
		"typescriptreact",
	},
	root_markers = { "biome.json", "package.json", ".git" },
}
