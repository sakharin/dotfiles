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
          "ts_ls",
          "yamlls",
        },
      })
    end,
  },
  {
    "rupurt/vim-mql5",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      -- Configure language server for clangd
      lspconfig.clangd.setup({
        cmd = { "clangd", "--background-index" },
        root_dir = function(fname)
          return require("lspconfig").util.root_pattern(
            "compile_flags.txt",
            "compile_commands.json",
            ".git",
            ".hg"
          )(fname) or vim.loop.os_homedir()
        end,
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })

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
            "<leader>gD",
            vim.lsp.buf.declaration,
            { table.unpack(opts), desc = "[G]o to [D]eclaration" }
          )
          vim.keymap.set(
            "n",
            "<leader>gd",
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
            "<leader>gi",
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
            "<leader>gr",
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

          -- Define the hooks
          local function CandCPP_hook()
            vim.bo.makeprg = "make"
            vim.bo.shiftwidth = 4
            vim.bo.softtabstop = 4
            vim.wo.number = true

            vim.keymap.set("n", "<F7>", ":make<CR>", { noremap = true, silent = true, buffer = true })
            vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>ko", { noremap = true, silent = true, buffer = true })
            vim.keymap.set(
              "i",
              "{;<CR>",
              "{<CR>};<Esc>ko",
              { noremap = true, silent = true, buffer = true }
            )
            vim.keymap.set(
              "i",
              "<c-L>",
              "coc#refresh()",
              { noremap = true, silent = true, expr = true, buffer = true }
            )
          end
          local function Mql_hook()
            vim.bo.filetype = "cpp"
            vim.bo.makeprg = "compile_mql"

            vim.keymap.set("n", "<F7>", function()
              vim.cmd("exe 'make' " .. vim.fn.expand("%:p"))
            end, { noremap = true, silent = true, buffer = true })
          end

          -- Create the augroup and autocommands using vim.api.nvim_create_autocmd
          vim.api.nvim_create_augroup("Mode_hooks_group", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp" },
            callback = CandCPP_hook,
            group = "Mode_hooks_group",
          })
          vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
            pattern = { "*.mq5", "*.mqh" },
            callback = Mql_hook,
            group = "Mode_hooks_group",
          })
        end,
      })
    end,
  },
}
