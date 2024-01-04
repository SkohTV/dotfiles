local config = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	local on_attach = function(_, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts) -- go to definition
		vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- peak definition
		vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
		vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
		vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
		vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buffer
		vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	end

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    Lua = {
      diagnostics = { globals = { "vim" } },
      -- workspace = { library = {
      --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --   [vim.fn.stdpath("config") .. "/lua"] = true,
      -- }},
    },
  })
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	lspconfig.efm.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			languages = {
				lua = { luacheck, stylua },
      },
    },
  })
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
		{ "j-hui/fidget.nvim", tag = "legacy" },
	},
}
