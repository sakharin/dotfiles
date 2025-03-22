require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Show vertical line at column 80
vim.opt.colorcolumn = "80"

-- Set ,e to open file in same directory of editing file
vim.keymap.set("n", ",e", ':e <C-R>=expand("%:p:h") . "/" <CR>')
