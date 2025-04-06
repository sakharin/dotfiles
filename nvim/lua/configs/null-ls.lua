local null_ls = require "null-ls"

local opts = {
  sources = {
    --Lua

    --Python
    --null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,

    --Typescript/Javascript
    null_ls.builtins.diagnostics.eslint,
  },
}
return opts
