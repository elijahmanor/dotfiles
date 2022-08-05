local has_module, lualine = pcall(require, "lualine")
if not has_module then
	return
end
local navic = require("nvim-navic")

lualine.setup({
	options = {
		theme = "material",
		disabled_types = { "NvimTree" },
	},
	sections = {
		lualine_b = { "diff", "diagnostics" },
		lualine_x = { "filetype" },
	},
	globalstatus = true
})
