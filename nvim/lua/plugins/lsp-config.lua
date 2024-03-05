return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "black" },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "cssls",
          "jsonls",
          "lua_ls",
          "marksman",
          "pyright",
          "tsserver",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.tsserver.setup({})

      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Set diagnostic location list" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            { table.unpack(opts), desc = "[G]o to [D]eclaration" }
          )
          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            { table.unpack(opts), desc = "[G]o to [D]efinition" }
          )
          vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            { table.unpack(opts), desc = "Displays hover information" }
          )
          vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            { table.unpack(opts), desc = "[G]o to [I]mplementation" }
          )
          vim.keymap.set(
            "n",
            "<C-k>",
            vim.lsp.buf.signature_help,
            { table.unpack(opts), desc = "Displays signature help" }
          )
          vim.keymap.set(
            "n",
            "<space>wa",
            vim.lsp.buf.add_workspace_folder,
            { table.unpack(opts), desc = "[A]dd [W]orkspace Folder" }
          )
          vim.keymap.set(
            "n",
            "<space>wr",
            vim.lsp.buf.remove_workspace_folder,
            { table.unpack(opts), desc = "[R]emove [W]orkspace Folder" }
          )
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { table.unpack(opts), desc = "[L]ist [W]orkspace Folders" })
          vim.keymap.set(
            "n",
            "<space>D",
            vim.lsp.buf.type_definition,
            { table.unpack(opts), desc = "Type [D]efinition" }
          )
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { table.unpack(opts), desc = "[R]ename" })
          vim.keymap.set(
            { "n", "v" },
            "<space>ca",
            vim.lsp.buf.code_action,
            { table.unpack(opts), desc = "[C]ode [A]ction" }
          )
          vim.keymap.set(
            "n",
            "gr",
            vim.lsp.buf.references,
            { table.unpack(opts), desc = "[G]o to [R]eferences" }
          )
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, { table.unpack(opts), desc = "[F]ormat" })
        end,
      })
    end,
  },
}
