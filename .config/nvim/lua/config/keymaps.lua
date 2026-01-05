vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Oil" })

vim.keymap.set(
	"n",
	"<leader>b",
	"<cmd>FzfLua buffers<cr>",
	{ desc = "Fzf Buffers" }
)
vim.keymap.set(
	"n",
	"<leader>f",
	"<cmd>FzfLua files<cr>",
	{ desc = "Fzf Files" }
)
vim.keymap.set(
	"n",
	"<leader>/",
	"<cmd>FzfLua live_grep<cr>",
	{ desc = "Fzf Grep" }
)
