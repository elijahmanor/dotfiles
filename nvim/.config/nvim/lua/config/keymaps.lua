-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>dd", function()
  Util.float_term({ "lazydocker" }, { cwd = Util.get_root() })
end, { desc = "Lazydocker" })

-- overwrite lazyvim mappings with vim-tmux-navigator mappings
-- see: https://github.com/christoomey/vim-tmux-navigator/blob/master/plugin/tmux_navigator.vim
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>"     )
vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>") 

local Terminal = require("toggleterm.terminal").Terminal
local lazydocker = Terminal:new({
  cmd = "lazydocker",
  hidden = true,
  close_on_exit = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
})

vim.keymap.set("n", "<leader>dd", function()
  lazydocker:toggle()
end, { desc = "Lazydocker", noremap = true, silent = true })

vim.keymap.set("i", "jj", "<esc>", { noremap = true })

