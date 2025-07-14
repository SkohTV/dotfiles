local config = function ()
    ---@diagnostic disable-next-line: missing-fields
    require("lazydev").setup({
        debug = false,
        library = { "nvim-cmp/lua/cmp/types" },
    })
end


return {
    "folke/lazydev.nvim",
    ft = "lua",
    config = config,
}
