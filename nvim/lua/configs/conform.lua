local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
  },
  formatters = {
    black = {
      prepend_args = { "--line-length", "79", "--fast" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
