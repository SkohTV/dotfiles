local config = function()
    vim.cmd([[colorscheme tokyonight-storm]])
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    config = config,
    priority = 1000,
}
