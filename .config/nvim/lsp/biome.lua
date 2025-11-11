---@type vim.lsp.Config
return {
	cmd = { "biome", "lsp-proxy" },
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
