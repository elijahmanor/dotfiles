vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO Does not seem to be feature to leave comments alone
-- https://github.com/JohnnyMorganz/StyLua/issues/252
-- stylua: ignore start

vim.opt.number = true             -- precede each line with its line number
vim.opt.relativenumber = true     -- show relative line number to the cursor
vim.opt.swapfile = false          -- temporary copy of your opened buffer
vim.opt.mouse = "a"               -- enables mouse support
vim.opt.shiftwidth = 4            -- number of spaces inserted for indentation
vim.opt.tabstop = 4               -- number of spaces that a <tab> represents
vim.opt.expandtab = false         -- don't replace tabs with spaces
vim.opt.wrap = false              -- don't wrap long content on next line
vim.opt.scrolloff = 8             -- minimum number of lines to keep above and below cursor
vim.opt.signcolumn = "yes"        -- always show the sign column
vim.opt.cursorline = true         -- highlight line where the cursor is located
vim.opt.updatetime = 50           -- milliseconds CursorHold autocommand event
vim.opt.clipboard = "unnamedplus" -- allows access to system clipboard
vim.opt.colorcolumn = "80"        -- column highlighted with hl-ColorColumn
vim.opt.undofile = true           -- enable undo file creation
vim.opt.showmode = false          -- remove messages like insert, replace, etc...
vim.opt.smartindent = true        -- indent automatically for c-like languages
vim.opt.splitbelow = true         -- add split below current one
vim.opt.splitright = true         -- add split to the right of current one
vim.opt.ignorecase = true         -- ignore case when searching
vim.opt.smartcase = true          -- override ignorecase if pattern has upper case
-- vim.opt.incsearch = true          -- show pattern matches while typing search command
vim.opt.termguicolors = true
vim.opt.lazyredraw = true         -- don't redraw screen while executing macros, etc...
vim.opt.completeopt = {           -- options for insert mode completion
	"menuone",
	"noselect",
	"noinsert"
}
vim.opt.termguicolors = true      -- enables 24-bit rgb color
vim.opt.foldmethod = "indent"     -- lines with equal indent for a fold
vim.opt.list = true               -- show hidden whitespace characters
vim.opt.listchars = {             -- list of hidden characters
	tab = "» ",
	trail = "•",
	precedes = "←",
	extends = "→",
	eol = "↲",
	nbsp = "␣"
}
vim.opt.iskeyword:append("-")     -- add `-` to the set of characters for a word

-- stylua: ignore end

