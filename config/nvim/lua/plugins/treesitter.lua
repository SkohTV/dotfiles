local config = function()
  vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } }) -- For hyprlang
end


return {{
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  dependencies = { -- Additional text objects for treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = { "BufEnter" },
  config = config,
}}
