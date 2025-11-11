---@type vim.lsp.Config
return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "css", "typescriptreact" },
	root_markers = { "postcss.config.mjs", ".git" },
	settings = {
		tailwindCSS = {
			classFunctions = { "cva", "cn" },
		},
	},
}
