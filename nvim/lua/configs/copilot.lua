-- For copilot.vim
-- enable copilot for specific filetypes
vim.g.copilot_filetypes = {
  ["TelescopePrompt"] = false,
}

-- Disable tab mapping
vim.g.copilot_no_tab_map = true
-- Set to true to assume that copilot is already mapped
vim.g.copilot_assume_mapped = true

local M = {}

-- Setup keymaps. Exposed as a function (not just run once at module load)
-- because NvChad's own defaults (nvchad.mappings, required from
-- lua/mappings.lua) bind insert-mode <C-h>/<C-j>/<C-l> to arrow keys, and
-- get applied *after* this module's config() runs during lazy.nvim setup --
-- silently overwriting these bindings. mappings.lua calls this again once
-- nvchad.mappings has loaded, so Copilot's bindings win.
function M.set_keymaps()
  local keymap = vim.keymap.set
  local opts = { silent = true }

  -- Set <C-j> to accept copilot suggestion (copilot.vim's own documented
  -- default binding). <C-c> is left alone: overriding it here replaced
  -- Neovim's native "leave insert mode" behavior, and inserted a stray
  -- newline via the fallback whenever no suggestion was showing.
  keymap("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

  -- Set <C-t> to accept line
  keymap("i", "<C-t>", "<Plug>(copilot-accept-line)", opts)

  -- Set <C-l> to next suggestion, <C-h> to previous suggestion, <C-s> to suggest
  keymap("i", "<C-l>", "<Plug>(copilot-next)", opts)
  keymap("i", "<C-h>", "<Plug>(copilot-previous)", opts)
  keymap("i", "<C-s>", "<Plug>(copilot-suggest)", opts)

  -- Set <C-n> to dismiss suggestion
  keymap("i", "<C-n>", "<Plug>(copilot-dismiss)", opts)
end

M.set_keymaps()

return M
