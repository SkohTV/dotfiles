-- Pane Navigation
vim.keymap.set("n", "<A-h>", "<C-w>h", opts) -- Navigate Left
vim.keymap.set("n", "<A-j>", "<C-w>j", opts) -- Navigate Down
vim.keymap.set("n", "<A-k>", "<C-w>k", opts) -- Navigate Up
vim.keymap.set("n", "<A-l>", "<C-w>l", opts) -- Navigate Right

-- Window Management
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimise

-- Indenting
vim.keymap.set("v", "<", "<gv") -- Shift Indentation to Left
vim.keymap.set("v", ">", ">gv") -- Shift Indentation to Right
