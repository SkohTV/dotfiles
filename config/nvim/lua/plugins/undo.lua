local config = function(_, opts)
	require("telescope").setup(opts)
	require("telescope").load_extension("undo")
end


return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	keys = { vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>") },
	lazy = true,
	config = config,
}
