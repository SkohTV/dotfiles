local config = function()
  require("copilot").setup({
    suggestion = {
      keymap = { accept = "<Tab>" },
      auto_trigger = true,
    }
  })
end

return {{
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  config = config,
  lazy = true,
}}
