return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        --LSP-----------------------------------------------------------------
        --"html-lsp",
        --"css-lsp",

        --Bash
        --"bash-language-server",

        --Lua
        --"lua-language-server",

        --Python
        "pyright",
        "ruff",

        --Typescript/Javascript
        --"tsp-server",

        --CSS
        --"css-lsp",

        --JSON
        --"json-lsp",

        --Markdown
        --"marksman",

        --YAML
        --"yaml-language-server",

        --Formatters----------------------------------------------------------
        --Bash
        --"beautysh",

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
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
}
