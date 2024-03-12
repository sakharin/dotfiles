-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set command line to 2 lines
vim.opt.cmdheight = 2

-- Highlighting search
vim.opt.hlsearch = true

-- Searches as you type
vim.opt.incsearch = true

-- Turn on line number.
vim.opt.number = true

-- Turn on cursor line
vim.opt.cul = true

-- Automatically set indent of new line
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftwidth = 2

-- Show vertical line at column 80
vim.opt.colorcolumn = "80"

-- Set ,e to open file in same directory of editing file
vim.keymap.set("n", ",e", ':e <C-R>=expand("%:p:h") . "/" <CR>')

-- Use system clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- Enables mouse support
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Disable arrow movement, resize splits instead.
vim.keymap.set("n", "<Up>", ":resize +2<CR>")
vim.keymap.set("n", "<Down>", ":resize -2<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>")
