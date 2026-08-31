#!/usr/bin/env bash
# Regression test: NvChad's default insert-mode arrow-key emulation
# (nvchad/mappings.lua maps <C-h>/<C-j>/<C-k>/<C-l> to <Left>/<Down>/<Up>/<Right>)
# loads after configs/copilot.lua and must not clobber Copilot's insert-mode
# accept/previous/next bindings.
#
# Run with the real user config (this script assumes ~/.config/nvim points at
# this repo's nvim/ dir, as set up via symlink).
set -euo pipefail

result_file="$(mktemp)"
trap 'rm -f "$result_file"' EXIT

nvim --headless -c '
lua vim.schedule(function() vim.defer_fn(function()
  local expected = {
    ["<C-j>"] = "copilot accept (expr mapping calling copilot#Accept)",
    ["<C-h>"] = "<Plug>(copilot-previous)",
    ["<C-l>"] = "<Plug>(copilot-next)",
  }
  local lines = {}
  local ok = true
  for key, desc in pairs(expected) do
    local m = vim.fn.maparg(key, "i", false, true)
    local rhs = m and m.rhs or nil
    local is_arrow = rhs == "<Left>" or rhs == "<Right>" or rhs == "<Down>" or rhs == "<Up>"
    if is_arrow then
      ok = false
      table.insert(lines, "FAIL " .. key .. ": expected " .. desc .. ", got NvChad arrow-key mapping (" .. rhs .. ")")
    else
      table.insert(lines, "PASS " .. key .. ": " .. tostring(rhs))
    end
  end
  local f = io.open("'"$result_file"'", "w")
  f:write(table.concat(lines, "\n") .. "\n")
  f:write(ok and "OVERALL PASS\n" or "OVERALL FAIL\n")
  f:close()
  vim.cmd("qa!")
end, 500) end)
' >/dev/null 2>&1

cat "$result_file"
grep -q "OVERALL PASS" "$result_file"
