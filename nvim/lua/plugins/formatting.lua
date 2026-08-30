return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Mason tool list lives in plugins/mason-tool-installer.lua: bare
  -- mason.nvim has no `ensure_installed` option, so it can't go here.
}
