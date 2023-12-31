local config = function()
	local surround = require("nvim-surround")
	surround.setup({})
end

return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	config = config,
}
