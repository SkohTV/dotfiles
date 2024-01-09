local config = function()
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local lspkind = require("lspkind")

  require("nvim-autopairs").setup() -- Setup auto pairs
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) -- Integrate autopairs with cmp
  require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets

  -- Cmp setup
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
      { name = "copilot" }, -- Copilot suggestions
      { name = "nvim_lsp" }, -- lsp
      { name = "luasnip", max_item_count = 3 }, -- snippets
      { name = "buffer", max_item_count = 5 }, -- text within current buffer
      { name = "path", max_item_count = 3 }, -- file system paths
    }),

    -- Enable pictogram icons for lsp/autocompletion
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


return {{
  "hrsh7th/nvim-cmp",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "windwp/nvim-ts-autotag",
    "windwp/nvim-autopairs",
  },
  config = config
}}
