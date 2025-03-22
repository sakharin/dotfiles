return {
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = function()
      return require "configs.git"
    end,
    lazy = false,
  },
}
