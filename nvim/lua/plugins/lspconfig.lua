return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "typescript-language-server"
        "ts_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
