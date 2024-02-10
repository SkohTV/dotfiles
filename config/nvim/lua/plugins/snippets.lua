local config = function ()
  require('snippets').use_suggested_mappings()
end


return {{
  "norcalli/snippets.nvim",
  event = "BufEnter",
  config = config,
}}
