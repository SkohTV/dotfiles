local config = function()
  local actions = require("telescope.actions")
  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-x>"] = actions.delete_buffer,
        },
      },
      file_ignore_patterns = {
        ".git",
        "_build",
      },
    },
  })
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", },
  config = config,
	keys = {
		vim.keymap.set("n", "<leader>fk", ":telescope keymaps<cr>"),
		vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>"),
		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
		vim.keymap.set("n", "<leader>fa", ":Telescope <CR>"),
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
	},
}
