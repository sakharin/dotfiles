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

      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set diagnostic location list" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = event.buf }
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
            "<leader>wa",
            vim.lsp.buf.add_workspace_folder,
            { table.unpack(opts), desc = "[A]dd [W]orkspace Folder" }
          )
          vim.keymap.set(
            "n",
            "<leader>wr",
            vim.lsp.buf.remove_workspace_folder,
            { table.unpack(opts), desc = "[R]emove [W]orkspace Folder" }
          )
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { table.unpack(opts), desc = "[L]ist [W]orkspace Folders" })
          vim.keymap.set(
            "n",
            "<leader>D",
            vim.lsp.buf.type_definition,
            { table.unpack(opts), desc = "Type [D]efinition" }
          )
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { table.unpack(opts), desc = "[R]ename" })
          vim.keymap.set(
            { "n", "v" },
            "<leader>ca",
            vim.lsp.buf.code_action,
            { table.unpack(opts), desc = "[C]ode [A]ction" }
          )
          vim.keymap.set(
            "n",
            "gr",
            vim.lsp.buf.references,
            { table.unpack(opts), desc = "[G]o to [R]eferences" }
          )
          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, { table.unpack(opts), desc = "[F]ormat" })
          vim.keymap.set(
            "n",
            "<leader>ds",
            vim.lsp.buf.document_symbol,
            { table.unpack(opts), desc = "[D]ocument [S]ymbol" }
          )
          vim.keymap.set(
            "n",
            "<leader>ws",
            vim.lsp.buf.workspace_symbol,
            { table.unpack(opts), desc = "[W]orkspace [S]ymbol" }
          )

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })
    end,
  },
}
