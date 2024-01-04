local config = function()
  require("dressing").setup()
end

return {{
  "stevearc/dressing.nvim",
  config = config,
}}
