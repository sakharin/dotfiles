local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = {
      "ruff_fix", -- Runs 'ruff check --fix' to lint and fix violations
      "ruff_format", -- Runs 'ruff format' for code style
      "ruff_organize_imports", -- Specifically for import sorting
    },
    javascript = { "eslint_d", "prettier" },
    javascriptreact = { "eslint_d", "prettier" },
    typescript = { "eslint_d", "prettier" },
    typescriptreact = { "eslint_d", "prettier" },
    json = { "prettier" },
  },
  formatters = {
    ruff_format = {
      args = {
        "format",
        "--line-length",
        "79",
        "--stdin-filename",
        "$FILENAME",
        "-",
      },
      stdin = true,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_format = "fallback",
  },
}

return options
