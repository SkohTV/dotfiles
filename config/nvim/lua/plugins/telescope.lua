local config = function()
    require("telescope").setup({
        defaults = {
            file_ignore_patterns = { ".git" }
        },
    })
end


return {{
    "nvim-telescope/telescope.nvim",
    config = config,
    dependencies = { "nvim-lua/plenary.nvim", },
}}
