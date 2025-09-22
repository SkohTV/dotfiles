local function _on_attach(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts)                 -- go to definition
    vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)        -- peak definition
    vim.keymap.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)        -- go to definition
    vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)            -- see available code actions
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)                 -- smart rename
    vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)   -- jump to prev diagnostic in buffer
    vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)   -- jump to next diagnostic in buffer
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                       -- show documentation for what is under cursor
    vim.keymap.set("n", "<leader>so", "<cmd>Lspsaga outline<CR>", opts)                -- toggle symbols outline
    vim.keymap.set("n", "<leader>fmt", "<cmd>lua vim.lsp.buf.format()<CR>", opts)      -- force formatting of file
end


local config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")


    local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = "" }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = _on_attach
    local add_ls = function(names)
        for _, item in ipairs(names) do
            lspconfig[item].setup({ capabilities = capabilities, on_attach = on_attach })
        end
    end

    add_ls({
        'pyright',           -- Python
        'rust_analyzer',     -- Rust
        'zls',               -- Zig

        'clangd',            -- C / C++
        'ts_ls',             -- JS / TS
        'mojo',              -- Mojo

        'nixd',              -- Nix
        'lua_ls',            -- Lua
        'bashls',            -- Bash
        'jdtls',             -- Java

        'cmake',             -- CMake
        'cssls',             -- css / scss
    })

end


return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
    }
}
