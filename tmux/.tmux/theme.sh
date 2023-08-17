#!/bin/bash

# https://github.com/victorkristof/tmux-auto-dark-mode/blob/master/scripts/auto-dark-mode.sh
get_system_mode() {
	# Check status of dark mode (ignore errors, i.e., when light mode is enabled).
	local status="$(defaults read -g AppleInterfaceStyle 2>/dev/null)"
	# Return system mode.
	if [[ $status == "Dark" ]]; then
		echo "dark"
	else
		echo "light"
	fi
}

# set -g @catppuccin_flavour 'latte' # or frappe, macchiato, mocha
function get_theme() {
	local mode=$(get_system_mode)
	tmux set-option -g @catppuccin_prepend ""
	# theme variables aren't available, so copy from catppuccin files
	if [[ $mode == "dark" ]]; then
		# tmux set-option -g @catppuccin_prepend "#[fg=#e5c890,bg=#414559]#[fg=#303446,bg=#e5c890] #[fg=#c6d0f5,bg=#303446] #( ~/.tmux/watson.sh ) "
		echo "frappe"
	else
		# tmux set-option -g @catppuccin_prepend "#[fg=#df8e1d,bg=#bcc0cc]#[fg=#dce0e8,bg=#df8e1d] #[fg=#4c4f69,bg=#dce0e8] #( ~/.tmux/watson.sh ) "
		echo "latte"
	fi
}

theme=$(get_theme)
tmux set-option -g @catppuccin_flavour "${theme}"
