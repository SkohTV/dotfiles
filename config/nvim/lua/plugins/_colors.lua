local config = function()

    ---@diagnostic disable-next-line: missing-fields
    require("tokyonight").setup({
        style = "storm",
    })

    vim.cmd[[colorscheme tokyonight]]
end


return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = config
}
