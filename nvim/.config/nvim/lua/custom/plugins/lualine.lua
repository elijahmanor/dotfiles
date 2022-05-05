local has_module, lualine = pcall(require, "lualine")
if not has_module then
	return
end

lualine.setup({
	options = {
		theme = "dracula",
		disabled_types = { "NvimTree" },
	},
	sections = {
		lualine_b = { "diff", "diagnostics" },
		lualine_x = { "filetype" },
	},
	globalstatus = true
})
