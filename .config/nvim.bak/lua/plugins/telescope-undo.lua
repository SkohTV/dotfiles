local config = function(_, opts)
	require("telescope").setup(opts)
	require("telescope").load_extension("undo")
end

local keys = { {
	"<leader>u",
	"<cmd>Telescope undo<cr>",
	desc = "undo history",
} }

return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	lazy = true,
	keys = keys,
	config = config,
}
