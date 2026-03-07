vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match) or ""
		if vim.treesitter.language.add(lang) then
			vim.treesitter.start()
			if vim.treesitter.query.get(lang, "folds") then
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.wo.foldlevel = 100
			end
			if vim.treesitter.query.get(lang, "indents") then
				vim.bo.indentexpr =
					"v:lua.require'nvim-treesitter'.indentexpr()"
			end
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
