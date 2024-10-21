vim.g.undotree_SplitWidth = 40

return {
  "mbbill/undotree",
  event = "BufEnter",
	keys = {
		vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>"),
  }
}
