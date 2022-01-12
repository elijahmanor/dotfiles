local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

keymap("n", "<leader>e", ":Lexplore<cr>", options)
keymap("n", "<leader><cr>", "<cmd>lua ReloadConfig()<cr>", options)

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", options)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').resume{}<cr>", options)
keymap("n", "<leader>fs", "<cmd>lua require('telescope').extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<cr>", options)
keymap("n", "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string( { search = vim.fn.input('Grep for > ') } )<cr>", options)

keymap("n", "<C-n>", ":NvimTreeToggle<cr>", options)
keymap("n", "<leader>r", ":NvimTreeRefresh<cr>", options)
keymap("n", "<leader>n", ":NvimTreeFindFile<cr>", options)

keymap("v", "J", ":m '>+1<CR>gv=gv", options)
keymap("v", "K", ":m '<-2<CR>gv=gv", options)

keymap("n", "<M-Right>", ":vertical resize -5<cr>", options)
keymap("n", "<M-Up>", ":resize +5<cr>", options)
keymap("n", "<M-Down>", ":resize -5<cr>", options)
keymap("n", "<M-Left>", ":vertical resize +5<cr>", options)
