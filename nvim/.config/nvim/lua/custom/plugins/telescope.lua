local has_module, telescope = pcall(require, "telescope")
if not has_module then
	return
end

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("harpoon")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "yarn.lock" },
		-- path_display = "smart"
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		},
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			-- theme = "dropdown",
			-- previewer = false,
			mappings = {
				i = {
					["<M-d>"] = "delete_buffer",
				},
			},
		},
	},
})
