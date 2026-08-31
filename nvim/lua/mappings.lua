require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- NvChad's defaults above (required at the top of this file) bind
-- insert-mode <C-h>/<C-j>/<C-l> to arrow keys, clobbering Copilot's
-- accept/previous/next bindings set earlier in configs/copilot.lua (that
-- plugin's config() runs during lazy.nvim setup, before this file loads).
-- Re-apply them now so Copilot wins.
require("configs.copilot").set_keymaps()

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- treesitter
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format [B]uffer" })
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Reveal file in neotree" })

-- disable horizontal and vertical terminal
nomap("n", "<leader>h")
nomap("n", "<leader>v")
