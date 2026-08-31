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
  -- Plug-mapped keys: rhs must match exactly. <C-f> is an expr mapping
  -- calling copilot#Accept(), so just check it wires up copilot#Accept
  -- rather than pinning the exact escaped string.
  local expected_exact = {
    ["<C-h>"] = "<Plug>(copilot-previous)",
    ["<C-l>"] = "<Plug>(copilot-next)",
  }
  local lines = {}
  local ok = true
  for key, want in pairs(expected_exact) do
    local m = vim.fn.maparg(key, "i", false, true)
    local rhs = m and m.rhs or nil
    if rhs ~= want then
      ok = false
      table.insert(lines, "FAIL " .. key .. ": expected " .. want .. ", got " .. tostring(rhs))
    else
      table.insert(lines, "PASS " .. key .. ": " .. tostring(rhs))
    end
  end
  do
    local key = "<C-f>"
    local m = vim.fn.maparg(key, "i", false, true)
    local rhs = m and m.rhs or nil
    if not (m and m.expr == 1 and rhs and rhs:find("copilot#Accept", 1, true)) then
      ok = false
      table.insert(lines, "FAIL " .. key .. ": expected expr mapping calling copilot#Accept, got " .. tostring(rhs))
    else
      table.insert(lines, "PASS " .. key .. ": " .. rhs)
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
