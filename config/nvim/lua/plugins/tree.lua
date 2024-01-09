return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
  config = true,
  keys = {
    vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>"),
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>"),
  }
}
