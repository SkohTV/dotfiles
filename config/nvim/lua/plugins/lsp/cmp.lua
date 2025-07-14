local config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    require("nvim-autopairs").setup()
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    cmp.setup({
        -- Snippet engine
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        -- Set mapping
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-u>"] = cmp.mapping.scroll_docs(4), -- scroll up preview
            ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- scroll down preview
            ["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
            ["<C-c>"] = cmp.mapping.abort(), -- close completion window
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
        }),

        -- Sources for autocompletion
        sources = cmp.config.sources({
            { name = "nvim_lsp" }, -- lsp
            { name = "luasnip", max_item_count = 3 }, -- snippets
            { name = "buffer", max_item_count = 5 }, -- text within current buffer
            { name = "path", max_item_count = 3 }, -- file system paths
        }),

        -- Enable pictogram icons for lsp/autocompletion
        ---@diagnostic disable-next-line: missing-fields
        formatting = {
            expandable_indicator = true,
            format = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                ellipsis_char = "...",
            }),
        },
    })
end


return {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPost", "BufNewFile" },
    config = config,
    dependencies = {
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",

        "saadparwaiz1/cmp_luasnip", -- source = luasnip
        "hrsh7th/cmp-buffer", -- source = buffer
        "hrsh7th/cmp-nvim-lsp",    -- source = lsp
        "hrsh7th/cmp-path",    -- source = path

        "windwp/nvim-autopairs",
    }
}
