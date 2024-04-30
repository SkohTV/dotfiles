local function arrow()
  local statusline = require("arrow.statusline")
  return statusline.text_for_statusline_with_icons()
end

local config = function()
  local diff_color = {
    added = {fg="#40ff33"},
    modified = {fg="#ffed33"},
    removed = {fg="#ff5733"},
  }

  require("lualine").setup({
    options = {
      theme = "tokyonight",
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", separator='', padding={left=1, right=1} },
        { "diff", padding={left=0,right=1}, diff_color=diff_color },
      },
      lualine_c = {
        { "diagnostics", padding={left=1, right=1} },
        { "buffers" },
        { arrow, color={fg='#88da85'} },
      },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" }
    },
  })
end

return {{
  "nvim-lualine/lualine.nvim",
  config = config,
}}
