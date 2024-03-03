-- Highlight, edit, and navigate code
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "javascript",
        "lua",
        "python",
        "query",
        "typescript",
        "vim",
        "vimdoc",
      },
      hightlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
