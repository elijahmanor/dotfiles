-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


local opt = vim.opt

opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.cmdheight = 0
vim.o.showcmdloc = "statusline"
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.opt.listchars = {
  space = ".",
  eol = "↲",
  nbsp = "␣",
  trail = "·",
  precedes = "←",
  extends = "→",
  tab = "¬ ",
  conceal = "※",
}
vim.opt.list = true

