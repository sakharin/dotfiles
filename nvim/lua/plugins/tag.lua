-- Provides an easy way to browse the tags of the current file
return {
  "preservim/tagbar",
  config = function()
    vim.keymap.set("n", "<leader>tt", ":TagbarToggle<CR>", { desc = "[T]agbar [T]oggle" })
    vim.keymap.set("n", "<leader>tc", ":TagbarClose<CR>", { desc = "[T]agbar [C]lose" })
  end,
}
