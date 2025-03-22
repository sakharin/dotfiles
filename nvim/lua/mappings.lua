require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- treesitter
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format [B]uffer" })
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Reveal file in neotree" })
