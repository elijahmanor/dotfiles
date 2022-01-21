local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

keymap("n", "<leader>e", ":Lexplore<cr>", options)

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", options)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').resume{}<cr>", options)
keymap("n", "<leader>fs", "<cmd>lua require('telescope').extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<cr>", options)
keymap("n", "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string( { search = vim.fn.input('Grep for > ') } )<cr>", options)

keymap("n", "Y", "y$", options)                 -- yank to the end of the line
keymap("v", "y", "ygv<esc>", options)           -- keep cursor at bottom of yanked region
keymap("n", "<esc>", ":noh<cr><esc>", options)  -- escape also clears any previous searches

keymap("n", "<leader>o", ":SymbolsOutline<cr>", options)
keymap("n", "<leader>gb", ":BufferLinePick<cr>", options)

keymap("n", "<leader>fo", "<cmd>lua vim.lsp.buf.formatting()<cr>", options)

keymap("n", "<C-n>", ":NvimTreeToggle<cr>", options)
keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", options)
keymap("n", "<leader>n", ":NvimTreeFindFile<cr>", options)

keymap("v", "J", ":m '>+1<CR>gv=gv", options)
keymap("v", "K", ":m '<-2<CR>gv=gv", options)

keymap("n", "<M-Right>", ":vertical resize -5<cr>", options)
keymap("n", "<M-Up>", ":resize +5<cr>", options)
keymap("n", "<M-Down>", ":resize -5<cr>", options)
keymap("n", "<M-Left>", ":vertical resize +5<cr>", options)

keymap("n", "<leader>h", ":HopChar2<cr>", options)

keymap("n", "<C-a>", "<Plug>(dial-increment)", options)
keymap("n", "<C-x>", "<Plug>(dial-decrement)", options)
keymap("v", "<C-a>", "<Plug>(dial-increment)", options)
keymap("v", "<C-x>", "<Plug>(dial-decrement)", options)
keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", options)
keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", options)

keymap("n", "]b", ":bnext<cr>", options)
keymap("n", "[b", ":bprev<cr>", options)
keymap("n", "[q", ":cprevious<cr>", options)
keymap("n", "]q", ":cnext<cr>", options)

keymap("n", "<leader>s", "<cmd>lua require('sidebar-nvim').toggle()<cr>", options)

