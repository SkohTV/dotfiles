-- vim.api.nvim_create_user_command('TOhtml2', function()
--     local cache_rnu = vim.opt_local.relativenumber:get()
--     local cache_nu = vim.opt_local.number:get()
--     local win = vim.api.nvim_get_current_win()
--
--     vim.opt.relativenumber = false
--     vim.opt.number = false
--     vim.api.nvim_exec2(':TOhtml', {})
--
--     vim.api.nvim_set_current_win(win)
--
--     vim.opt_local.relativenumber = cache_rnu
--     vim.opt_local.number = cache_nu
-- end, { nargs = 0, desc = 'Convert current buffer to well formatted html' })




vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        local filetype = vim.bo.filetype
        if vim.bo.modified == true and mode == 'n' and filetype ~= "oil" then
            vim.cmd('lua vim.lsp.buf.format()')
        else
        end
    end
})
