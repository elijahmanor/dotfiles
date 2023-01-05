require("telescope").load_extension("file_browser")
require("telescope").load_extension("dir")

vim.cmd([[colorscheme dracula]])

vim.opt.clipboard = "unnamedplus" -- allows access to system clipboard
vim.opt.shiftwidth = 4 -- number of spaces inserted for indentation
vim.opt.tabstop = 4 -- number of spaces that a <tab> represents
vim.opt.expandtab = false -- don't replace tabs with spaces
vim.opt.wrap = false -- don't wrap long content on next line
vim.opt.relativenumber = true -- show relative line number to the cursor
vim.opt.swapfile = false -- temporary copy of your opened buffer
vim.opt.shiftwidth = 4 -- number of spaces inserted for indentation
vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below cursor
vim.opt.cursorline = true -- highlight line where the cursor is located
vim.opt.colorcolumn = "80" -- column highlighted with hl-ColorColumn
vim.opt.showmode = false -- remove messages like insert, replace, etc...
vim.opt.smartindent = true -- indent automatically for c-like languages
vim.opt.splitbelow = true -- add split below current one
vim.opt.splitright = true -- add split to the right of current one
-- vim.opt.lazyredraw = true         -- don't redraw screen while executing macros, etc...
vim.opt.list = true -- show hidden whitespace characters
vim.opt.listchars = { -- list of hidden characters
	tab = "» ",
	trail = "•",
	precedes = "←",
	extends = "→",
	eol = "↲",
	space = "␣",
}
vim.opt.laststatus = 3 -- always and ONLY the last window
vim.opt.winbar = "%=%m %f" -- determine contents of top window bar
vim.opt.cmdheight = 0 -- hide command-line bar when not used
vim.g.netrw_keepdir = 0 -- keey the current dir the same as browsing dir
vim.g.netrw_winsize = 30 -- initial size of new netrw windows
vim.g.netrw_banner = 0 -- hide banner
vim.g.netrw_browse_split = 4 -- open in previous window
vim.g.netrw_altv = 1 -- open with right splitting
vim.g.netrw_liststyle = 3 -- tree-style view
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-n>", "<cmd>Lexplore<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>n", "<cmd>Lexplore %:p:h<cr>", { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>sr",
	"<cmd>lua require('telescope.builtin').resume{}<cr>",
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "<M-Right>", ":vertical resize -5<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", ":resize +5<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", ":resize -5<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Left>", ":vertical resize +5<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>sb", ":Telescope file_browser path=%:p:h<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ss", require("telescope.builtin").git_status, { desc = "[S]earch Git [S]tatus" })
vim.keymap.set("n", "<leader>sw", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Find String: ") })
end, { desc = "[S]earch [W]ord" })

vim.keymap.set("n", "<leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
vim.diagnostic.config({ virtual_text = false })
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "[P]acker [S]ync" })

vim.keymap.set("n", "<leader>=", function()
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end, { desc = "[F]ormat", noremap = true, silent = true })

vim.keymap.set("n", "<leader>.", "", {
	silent = true,
	desc = "reload init.lua",
	callback = function()
		vim.cmd([[
			update $MYVIMRC
			source $MYVIMRC
		]])
		vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
	end,
})
vim.keymap.set("n", "]b", ":bnext<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "[b", ":bprev<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "[q", ":cprevious<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "]q", ":cnext<cr>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- vim.keymap.set("n", "n", "nzz", { noremap = true, silent = true })
-- vim.keymap.set("n", "N", "Nzz", { noremap = true, silent = true })

vim.keymap.del("n", "<leader>sd")
vim.keymap.set("n", "<leader>sdg", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sdf", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local packer_user_config = create_augroup("packer_user_config", { clear = true })
create_autocmd("BufWritePost", {
	pattern = "*/lua/custom/plugins/init.lua",
	command = "source <afile> | PackerCompile",
	group = packer_user_config,
})

local relativenumber_toggle = create_augroup("relativenumber_toggle", { clear = true })
create_autocmd({ "BufLeave", "InsertEnter", "FocusLost" }, {
	--     pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "SidebarNvim" then
			vim.opt.relativenumber = false
			vim.opt.list = true
		end
	end,
	group = relativenumber_toggle,
})
create_autocmd({ "BufEnter", "InsertLeave", "FocusGained" }, {
	--     pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "alpha" and vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "SidebarNvim" then
			vim.opt.relativenumber = true
			vim.opt.list = false
		end
	end,
	group = relativenumber_toggle,
})

