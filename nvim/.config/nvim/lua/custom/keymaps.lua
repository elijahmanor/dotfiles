local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

keymap("n", "<leader>wrap", "gggwGG", options)

keymap("n", "<leader>e", ":Lexplore<cr>", options)

keymap("n", "<leader><cr>", "<cmd>lua require('custom.utils').reload()<cr>", options)
keymap("n", "<leader>ww", "<cmd>lua print('new thing')", options)

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", options)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').resume{}<cr>", options)
keymap("n", "<leader>fs", "<cmd>lua require('telescope').extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<cr>", options)
keymap("n", "<leader>ps", "<cmd>lua require('telescope.builtin').grep_string( { search = vim.fn.input('Grep for > ') } )<cr>", options)
keymap("n", "<leader>gs", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>'), vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--glob=!**.spec.*' } })<cr>", options)

-- -g '!{**/node_modules/*,**/.git/*}'
keymap("n", "<leader>la", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", options)
keymap("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", options)
keymap("n", "<leader>ld", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", options)
keymap("n", "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", options)
keymap("n", "<leader>ci", "<cmd>lua vim.diagnostic.open_float()<cr>", options)

keymap("n", "<C-f>", ":!tmux neww tmux-sessionizer<cr>", options)

keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<cr>", options)
keymap("n", "<leader>,", ":Telescope harpoon marks<cr>", options)
keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<cr>", options)
keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<cr>", options)
keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<cr>", options)
keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<cr>", options)

keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", options)

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

keymap("n", "s", ":HopChar2<cr>", options)

keymap("n", "]b", ":bnext<cr>", options)
keymap("n", "[b", ":bprev<cr>", options)
keymap("n", "[q", ":cprevious<cr>", options)
keymap("n", "]q", ":cnext<cr>", options)

keymap("n", "<leader>s", "<cmd>lua require('sidebar-nvim').toggle()<cr>", options)

