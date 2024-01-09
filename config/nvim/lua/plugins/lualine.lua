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
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
    },
  })
end

return {{
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = config,
}}
