local config = function()
  require("lualine").setup({
    options = {
      theme = "tokyonight",
      globalstatus = true
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "buffers" },
      lualine_x = { "fileformat", "encoding" },
      lualine_y = { "filetype" },
      lualine_z = { "location" }
    }
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config
}
