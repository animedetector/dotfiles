---@class Plugins
---@field specs (string|vim.pack.Spec)[]
---@filed setup fun()
local M = {}

local gh = function(x)
	return "https://github.com/" .. x
end

M.specs = {
	gh("folke/tokyonight.nvim"),
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
	gh("lewis6991/gitsigns.nvim"),
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1") },
	gh("ibhagwan/fzf-lua"),
	gh("stevearc/oil.nvim"),
	gh("benomahony/oil-git.nvim"),
	gh("JezerM/oil-lsp-diagnostics.nvim"),
}

M.setup = function()
	require("tokyonight").setup({
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	})
	require("blink.cmp").setup()
	require("oil").setup({ view_options = { show_hidden = true } })
	require("oil-lsp-diagnostics").setup()

	vim.api.nvim_create_autocmd("FileType", {
		callback = function(ev)
			local lang = vim.treesitter.language.get_lang(ev.match) or ""
			if vim.treesitter.language.add(lang) then
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			elseif
				vim.list_contains(
					require("nvim-treesitter.config").get_available(),
					lang
				)
			then
				vim.notify(
					string.format(
						"Run `:TSInstall %s` to enable treesitter!",
						lang
					),
					vim.log.levels.INFO
				)
			end
		end,
	})
end

return M
