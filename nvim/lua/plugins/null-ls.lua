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
        --Liners
        --Bash

        --Lua

        --Python
        --"mypy",
        "ruff",
        "pyright",

        --Typescript/Javascript

        --CSS

        --JSON

        --Markdown

        --YAML

        --Formatters
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
