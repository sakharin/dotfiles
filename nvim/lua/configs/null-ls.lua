local null_ls = require "null-ls"

local opts = {
  sources = {
    --Lua

    --Python
    --null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,

    --Typescript/Javascript
    -- eslint disabled: using nvim-lint instead (lint.lua)
    -- null_ls.builtins.diagnostics.eslint,
  },
}
return opts
