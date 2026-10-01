---@type vim.lsp.Config
return {
	cmd = { "gopls" },
	filetypes = { "go", "gotmpl", "gomod", "gowork" },
	root_markers = { "go.work", "go.mod", ".git" },
}
