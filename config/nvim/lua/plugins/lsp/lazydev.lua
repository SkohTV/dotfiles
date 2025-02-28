local config = function ()
  require("lazydev").setup({
    debug = false,
    library = {
      "nvim-cmp/lua/cmp/types",
    },
  })
end


return {
    "folke/lazydev.nvim",
    ft = "lua",
    config = config,
}
