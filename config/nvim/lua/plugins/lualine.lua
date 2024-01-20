local config = function()
  require("lualine").setup({
    options = {
      theme = "tokyonight",
      globalstatus = true,
    },
    sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "buffers" },
    lualine_x = { { "copilot", show_colors = true }, "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
    },
  })
end

return {{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "AndreM222/copilot-lualine" },
  config = config,
}}
