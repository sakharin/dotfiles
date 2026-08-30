-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
---@class M
local M = {}

M.base46 = {
  theme = "ashes",
}

M.ui = {
  statusline = {
    modules = {
      f = "%F", -- show full file path instead of the default
    },
  },
}

M.term = {
  winopts = { number = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.4,
    border = "single",
  },
}

M.lsp = {
  signature = true,
}

M.cheatsheet = {
  theme = "grid", -- simple/grid
  excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
}

return M
