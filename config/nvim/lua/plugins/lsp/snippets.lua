local config = function ()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    require("luasnip.loaders.from_vscode").lazy_load()


    local map_leaderpp = function(filetype, snippet)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetype,
            callback = function ()
                vim.keymap.set("n", "<leader>pp", function()
                    ls.snip_expand(snippet)
                end)
            end,
        })
    end


    map_leaderpp('python', s('', { t({'print("'}), i(1), t({'")'}) }))
    map_leaderpp('rust', s('', { t({'println!("'}), i(1), t({'");'}) }))
    map_leaderpp('javascript', s('', { t({'console.log("'}), i(1), t({'");'}) }))
    map_leaderpp('c', s('', { t({'printf("'}), i(1), t({'");'}) }))

end


return {
    "L3MON4D3/LuaSnip",
    event = { "BufEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    config = config,
}
