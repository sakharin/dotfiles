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
    javascript = { "prettier" },
    typescript = { "prettier" },
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
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
