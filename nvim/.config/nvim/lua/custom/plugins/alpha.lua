local has_module, alpha = pcall(require, "alpha")
if not has_module then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene<cr>"),
	dashboard.button("<C-n>", "  File Explorer"),
	dashboard.button("<Leader>ff", "  Find File"),
	dashboard.button("<Leader>fg", "  Find Word"),
	dashboard.button("<Leader>ps", "  Update plugins", ":PackerSync<cr>"),
	dashboard.button("<Leader>fh", "  Recent Files"),
	dashboard.button("q", "  Quit", ":qa<cr>"),
}
dashboard.section.footer.val = function()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	return "\n"
		.. datetime
		.. "   "
		.. total_plugins
		.. " plugins"
		.. "   v"
		.. vim.version().major
		.. "."
		.. vim.version().minor
		.. "."
		.. vim.version().patch
end
alpha.setup(dashboard.opts)
