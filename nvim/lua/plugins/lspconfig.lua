return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "ruff",
        "pyright",
      },
    },
  },
}
