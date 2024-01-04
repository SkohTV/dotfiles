local init = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

return {{
	"folke/which-key.nvim",
	event = "VeryLazy",
  config = true,
	init = init,
}}
