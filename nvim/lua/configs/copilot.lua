-- For copilot.vim
-- enable copilot for specific filetypes
vim.g.copilot_filetypes = {
  ["TelescopePrompt"] = false,
}

-- Disable tab mapping
vim.g.copilot_no_tab_map = true
-- Set to true to assume that copilot is already mapped
vim.g.copilot_assume_mapped = true

-- Setup keymaps
local keymap = vim.keymap.set
local opts = { silent = true }

-- Set <C-c> to accept copilot suggestion
keymap("i", "<C-c>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

-- Set <C-t> to accept line
keymap("i", "<C-t>", "<Plug>(copilot-accept-line)", opts)

-- Set <C-l> to next suggestion, <C-h> to previous suggestion, <C-s> to suggest
keymap("i", "<C-l>", "<Plug>(copilot-next)", opts)
keymap("i", "<C-h>", "<Plug>(copilot-previous)", opts)
keymap("i", "<C-s>", "<Plug>(copilot-suggest)", opts)

-- Set <C-n> to dismiss suggestion
keymap("i", "<C-n>", "<Plug>(copilot-dismiss)", opts)
