local wezterm = require("wezterm")

return {
	window_decorations = "RESIZE",
	-- color_scheme = "Hardcore",
	-- font = wezterm.font("JetBrains Mono"),
	-- font = wezterm.font("JetBrainsMono Nerd Font"),
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		{ family = "Symbols Nerd Font Mono", scale = 0.75 },
	}),
	font_size = 16,
	scrollback_lines = 5000,
	hide_tab_bar_if_only_one_tab = true,
}
