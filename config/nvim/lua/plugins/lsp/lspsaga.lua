local config = function()
    require('lspsaga').setup({})

    require('neogen').setup({})
    require('Comment').setup({})

    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<Leader>ng", ":lua require('neogen').generate()<CR>", opts)
end


return {
    'nvimdev/lspsaga.nvim',
    config = config,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',

        "danymat/neogen",
        "numToStr/Comment.nvim",
    }
}
