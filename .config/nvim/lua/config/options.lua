vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
				string.format("Run `:TSInstall %s` to enable treesitter!", lang),
				vim.log.levels.INFO
			)
		end
	end,
})

vim.lsp.config("*", { root_markers = { ".git" } })

vim.diagnostic.config({ virtual_text = { prefix = ">", spacing = 4 } })

local opt = vim.opt

opt.shortmess:append({ I = true })
opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.inccommand = "split"
