local keymap = vim.keymap
local api = vim.api
local opts =  { noremap = true, silent = true }

-- Directory Navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts) -- Focus tree view
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Hide/Show tree view

-- Pane Navigation
keymap.set("n", "<A-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<A-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<A-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<A-l>", "<C-w>l", opts) -- Navigate Right

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimise

-- Indenting
keymap.set("v", "<", "<gv") -- Shift Indentation to Left
keymap.set("v", ">", ">gv") -- Shift Indentation to Right

-- Comments
api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
api.nvim_set_keymap("v", "<C-_>", "gb", { noremap = false })
