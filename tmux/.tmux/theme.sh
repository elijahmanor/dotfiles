#!/usr/bin/env bash

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

function get_theme() {
	local mode=$(get_system_mode)
	if [[ $status == "Dark" ]]; then
		echo "frappe"
	else
		echo "latte"
	fi
}

get_theme
