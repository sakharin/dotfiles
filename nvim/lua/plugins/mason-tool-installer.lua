-- Single source of truth for Mason-installed tools (LSP servers, formatters,
-- linters). Bare mason.nvim has no `ensure_installed` option -- that
-- requires mason-tool-installer.nvim, so tool names below must be Mason
-- registry package names, not nvim-lspconfig server names (e.g.
-- "typescript-language-server", not "ts_ls").
return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- LSP servers
        "pyright",
        "eslint-lsp",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "bash-language-server",
        "awk-language-server",

        -- Formatters / linters
        "stylua",
        "prettier",
        "ruff", -- also the Python LSP server
      },
    },
    config = function(_, opts)
      require("mason-tool-installer").setup(opts)
    end,
  },
}
