local config = function()
  local wilder = require("wilder")

  -- Enable wilder when pressing :, / or ?
  wilder.setup({ modes = { ":", "/", "?" } })

  -- Enable fuzzy matching for commands and buffers
  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.cmdline_pipeline({
        language = "vim",
        fuzzy = 1,
        file_command = {'rg', '--files'},
        dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
      }),
      wilder.vim_search_pipeline({
        language = "vim",
        fuzzy = 1,
        file_command = {'rg', '--files'},
        dir_command = {'find', '.', '-type', 'd', '-printf', '%P\n'},
      })
    ),
  })

  -- Customize renderer
  wilder.set_option('renderer', wilder.popupmenu_renderer({
    highlighter = { wilder.lua_fzy_highlighter() },
    highlights = {
      accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
    },
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
  }))
end

return {{
  "gelguy/wilder.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "romgrk/fzy-lua-native" },
  keys = {
    ":",
    "/",
    "?",
  },
  config = config,
}}
