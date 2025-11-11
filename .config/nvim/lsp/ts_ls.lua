---@type vim.lsp.Config
return {
	cmd = { "tsgo", "--lsp", "--stdio" },
	filetypes = { "javascript", "typescript", "typescriptreact" },
	root_markers = { "tsconfig.json", "package.json", ".git" },
}
