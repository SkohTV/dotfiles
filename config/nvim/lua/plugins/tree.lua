local config = function()
  -- Check doc for why
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup()
end


return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
  config = config,
  keys = {
    vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>"),
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>"),
  }
}
