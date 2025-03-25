require "nvchad.mappings"

local nomap = vim.keymap.del

nomap("n", "<leader>h")
nomap("n", "<leader>v")

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general [s]ave file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general [c]opy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line [n]umber" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle [r]elative [n]umber" })
map("n", "<leader>ch", "<cmd>nvcheatsheet<cr>", { desc = "toggle nv[ch]eatsheet" })

map("n", "<leader>gf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "[g]eneral [f]ormat file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP [d]iagno[s]tic loclist" })

-- tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "[b]uffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "telescope [s]earch [g]rep" })
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "telescope [s]earch [b]uffers" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "telescope [s]earch [h]elp page" })
map("n", "<leader>sm", "<cmd>Telescope marks<CR>", { desc = "telescope [s]earch [m]arks" })
map("n", "<leader>so", "<cmd>Telescope oldfiles<CR>", { desc = "telescope [s]earch [o]ldfiles" })
map("n", "<leader>sc", "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "telescope [s]earch in [c]urrent buffer" })
map("n", "<leader>hc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git [c]ommits" })
map("n", "<leader>ht", "<cmd>Telescope git_status<CR>", { desc = "telescope git s[t]atus" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope [p]ick hidden [t]erm" })
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { desc = "[S]earch [K]eymaps" })
map("n", "<leader>ss", "<cmd>Telescope builtin<CR>", { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch current [W]ord" })
map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "[S]earch [R]esume" })

map("n", "<leader>tc", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad [t]hemes [c]hange" })

map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "telescope [s]earch [f]iles" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope [f]ind [a]ll files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "[t]erminal new [h]orizontal term" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "[t]erminal new [v]ertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "[w]hichkey all [K]eymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "[w]hich[k]ey query lookup" })
------------------------------------------------------------------------------

-- add yours here

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- treesitter
map("n", "<leader>fm", vim.lsp.buf.format, { desc = "format buffer" })
map("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Reveal file in neotree" })
