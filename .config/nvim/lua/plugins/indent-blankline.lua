local config = function()
  require("ibl").setup({})
end

return {{
  "lukas-reineke/indent-blankline.nvim",
  event = "BufEnter",
  main = "ibl",
  config = config,
}}
