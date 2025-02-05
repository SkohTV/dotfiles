-- Pane Navigation
vim.keymap.set("n", "<A-h>", "<C-w>h", opts) -- Navigate Left
vim.keymap.set("n", "<A-j>", "<C-w>j", opts) -- Navigate Down
vim.keymap.set("n", "<A-k>", "<C-w>k", opts) -- Navigate Up
vim.keymap.set("n", "<A-l>", "<C-w>l", opts) -- Navigate Right

-- Window Management
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)          -- Split Vertically
vim.keymap.set("n", "<leader>sh", ":split<CR>", opts)           -- Split Horizontally
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimise

-- Indenting
vim.keymap.set("v", "<", "<gv") -- Shift Indentation to Left
vim.keymap.set("v", ">", ">gv") -- Shift Indentation to Right

vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>")

vim.keymap.set({ "n", "v", "i" }, ",p", "\"0p")
vim.keymap.set({ "n", "v", "i" }, ",P", "\"0P")
