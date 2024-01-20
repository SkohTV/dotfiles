-- Line number
vim.opt.number = true -- Print the line number in front of each line
vim.opt.relativenumber = true -- Show relative line number in front of each line

-- Tab / indent behavior
vim.opt.tabstop = 2 -- Number of spaces for <Tab> in file 
vim.opt.softtabstop = 2 -- Number of spaces for <Tab> editing
vim.opt.expandtab = true -- Use space when pressed <Tab>
vim.opt.smartindent = true -- Smart autoindenting
vim.opt.shiftwidth = 2 -- Number of spaces to use for indent 
vim.opt.breakindent = true -- Wrapped line repeats indent
vim.opt.wrap = false -- Long lines don't wrap 

-- External inputs
vim.opt.mouse = "" -- Disable the mouse
vim.opt.clipboard = "unnamed,unnamedplus" -- Enable system clipboard

-- Neovim files behavior
vim.opt.swapfile = false -- Use a swap file not a buffer
vim.opt.undofile = true --  Save undo in a file
vim.opt.hidden = true -- Don't unload buffer when abandoned
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Window behavior
vim.opt.splitbelow = true -- New window from split is below the current one
vim.opt.splitright = true -- New window is put right of the current one
vim.opt.termguicolors = true -- Enable 24-bit color
vim.opt.cmdheight = 1 -- Size for command line

-- Search behavior
vim.opt.incsearch = true -- Highlight matches while search
vim.opt.hlsearch = true -- Highlight matches with last search 
vim.opt.ignorecase = true -- Ignore case in search 
vim.opt.smartcase = true -- No ignore case when pattern has capital

-- Cursor behavior
vim.opt.cursorline = true -- Highlight line where cursor is 
vim.opt.scrolloff = 8 -- Min number lines below / above cursor

-- Column at X line
vim.opt.colorcolumn = "88" -- Highlight the X column
vim.opt.signcolumn = "yes" -- Display the sign column

-- For folding, idk
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Options for insert mode completion
vim.opt.completeopt = {
  "menuone",
  "noselect"
} 

-- Set cursor shape
vim.opt.guicursor = {
	"n-v-c:block", 
	"i-ci-ve:block", 
	"r-cr:hor20", 
	"o:hor50", 
	"a:blinkwait700-blinkoff400-blinkon250", 
	"sm:block-blinkwait175-blinkoff150-blinkon175", 
}
