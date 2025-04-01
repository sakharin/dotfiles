local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    --Bash

    --Lua

    --Python
    --null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    --Typescript/Javascript
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,

    --CSS

    --JSON

    --Markdown

    --YAML
    --
    --Bash

    --Lua
    null_ls.builtins.formatting.stylua,

    --Python
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black.with {
      extra_args = { "--line-length", "79", "--fast" },
    },

    --Typescript/Javascript
    null_ls.builtins.formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
