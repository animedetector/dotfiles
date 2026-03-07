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
}

M.setup = function()
	require("tokyonight").setup({ style = "night" })
	require("blink.cmp").setup()
	require("oil").setup({ view_options = { show_hidden = true } })
end

return M
