return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          --Bash

          --Lua
          "stylua",

          --Python
          "isort",
          "black",

          --Typescript/Javascript
          "prettier",

          --CSS

          --JSON

          --Markdown

          --YAML
        },
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          --Bash

          --Lua
          null_ls.builtins.formatting.stylua,

          --Python
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length", "79", "--fast" },
          }),

          --Typescript/Javascript
          null_ls.builtins.formatting.prettier,
        },

        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                --vim.lsp.buf.formatting_sync()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format [B]uffer" })
    end,
  },
}
