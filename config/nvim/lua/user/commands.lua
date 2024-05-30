vim.api.nvim_create_user_command('TOhtml2', function ()

  local cache_rnu = vim.opt_local.relativenumber:get()
  local cache_nu = vim.opt_local.number:get()

  -- open new buffer with current text
  -- change parameters of buffer
  -- to html
  -- save to clipboard
  -- close tohtml buffer
  -- close previous buffer
  
  vim.api.nvim_exec2('<escape>v', {})

  local newbuf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_set_current_buf(newbuf)

  -- vim.opt.relativenumber = false
  -- vim.opt.number = false
  -- vim.api.nvim_exec2(':TSBufDisable highlight', {})
  -- vim.api.nvim_exec2(':TOhtml', {})
  --
  -- vim.api.nvim_exec2(':TSBufEnable highlight', {})
  -- vim.opt_local.relativenumber = cache_rnu
  -- vim.opt_local.number = cache_nu

end, { nargs = 0, desc = 'Convert current buffer to well formatted html'} )
