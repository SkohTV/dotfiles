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
    vim.keymap.set("n", "<leader>so", "<cmd>Lspsaga outline<CR>", opts) -- toggle symbols outline
    vim.keymap.set("n", "<leader>fmt", "<cmd>lua vim.lsp.buf.format()<CR>", opts) -- force formatting of file
	end

  -- Python
  lspconfig.pyright.setup({
    capabilities = capabilities, on_attach = on_attach,
    init_options = { settings = { args = { "" } } }
  })
  local ruff_l = require('efmls-configs.linters.ruff')
  local ruff_f = require('efmls-configs.formatters.ruff')

  -- Rust
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities, on_attach = on_attach,
    settings = { ['rust-analyzer'] = {} }
  })
  local rustfmt = require('efmls-configs.formatters.rustfmt')

  -- Lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities, on_attach = on_attach,
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      }},
    },
  })
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

  -- C / C++
  lspconfig.clangd.setup({
    capabilities = capabilities, on_attach = on_attach,
    cmd = { "clangd", "--offset-encoding=utf-16" },
  })
  local clang_tidy = require('efmls-configs.linters.clang_tidy')
  local clang_format = require('efmls-configs.formatters.clang_format')

  -- Php
  lspconfig.phpactor.setup({
    capabilities = capabilities, on_attach = on_attach,
  })

  -- Nix
  lspconfig.nixd.setup({
    capabilities = capabilities, on_attach = on_attach,
  })
  local statix = require('efmls-configs.linters.statix')

	lspconfig.efm.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			languages = {
        python = { ruff_l, ruff_f },
        rust = { rustfmt },
				lua = { luacheck, stylua },
        c = { clang_tidy, clang_format }, cpp = { clang_tidy, clang_format },
        php = { },
        nix = { statix },
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
