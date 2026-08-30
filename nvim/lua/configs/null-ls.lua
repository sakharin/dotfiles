local null_ls = require "null-ls"

local opts = {
  sources = {
    --Lua

    --Python
    --null_ls.builtins.diagnostics.mypy,
    -- ruff disabled: the ruff LSP server (configs/lspconfig.lua) already
    -- reports these diagnostics; running both duplicated every finding.
    -- null_ls.builtins.diagnostics.ruff,

    --Typescript/Javascript
    -- eslint disabled: using nvim-lint instead (lint.lua)
    -- null_ls.builtins.diagnostics.eslint,
  },
}
return opts
