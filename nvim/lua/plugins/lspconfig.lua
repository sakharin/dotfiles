return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },
  -- Mason tool list lives in plugins/mason-tool-installer.lua: bare
  -- mason.nvim has no `ensure_installed` option, so it can't go here.
}
