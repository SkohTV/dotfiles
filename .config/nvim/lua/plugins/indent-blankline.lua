local config = function()
  require("ibl").setup({
    scope = { enabled = false },
  })
end

return {{
  "lukas-reineke/indent-blankline.nvim",
  event = "BufEnter",
  main = "ibl",
  config = config,
}}
