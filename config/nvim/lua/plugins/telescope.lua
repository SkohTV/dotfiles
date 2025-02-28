local config = function()
    require("telescope").setup({
        defaults = {
            file_ignore_patterns = { ".git" }
        },
    })
end


return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", },
    config = config,
}
