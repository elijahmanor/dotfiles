local wezterm = require("wezterm")

return {
	window_decorations = "RESIZE",
	color_scheme = "Dracula (Official)",
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		{ family = "Symbols Nerd Font Mono", scale = 0.75 },
	}),
	window_background_opacity = 0.9,
	macos_window_background_blur = 20,
	adjust_window_size_when_changing_font_size = false,
	use_cap_height_to_scale_fallback_fonts = true,
	font_size = 16,
	scrollback_lines = 5000,
	hide_tab_bar_if_only_one_tab = true,
}
