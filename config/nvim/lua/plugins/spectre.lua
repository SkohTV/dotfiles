local config = function()
    require("spectre").setup({})
end


return {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = config,

    dependencies = {
        "nvim-lua/plenary.nvim",
    }
}
