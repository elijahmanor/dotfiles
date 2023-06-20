#!/bin/bash

function mrwatson() {
	local status=""
	if [[ "$(watson status)" == "No project started." ]]; then
		status=""
	fi
	local total=$(watson report -dcG | grep 'Total:' | sed 's/Total: //')
	printf "%s %s" "${status}" "${total}"
}

mrwatson
