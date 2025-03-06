-- Leaders

-- Line number
vim.opt.number = true -- Print the line number in front of each line
vim.opt.relativenumber = true -- Show relative line number in front of each line

-- Indenting
vim.opt.expandtab = true -- Use space when pressed <Tab>
vim.opt.shiftwidth = 4 -- Number of spaces to use for indent
vim.opt.wrap = false -- Long lines don't wrap

-- Cursor behavior
vim.opt.cursorline = true -- Highlight line where cursor is
vim.opt.scrolloff = 8 -- Min number lines below / above cursor

-- Set cursor shape
vim.opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:block",
	"r-cr:hor20",
	"o:hor50",
	"a:blinkwait700-blinkoff400-blinkon250",
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.opt.signcolumn = 'yes'


-- Columns
vim.opt.colorcolumn = "88" -- Highlight the X column
vim.opt.signcolumn = "yes" -- Display the sign column

-- Netrw line numbers
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
