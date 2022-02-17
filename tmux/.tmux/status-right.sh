#!/bin/bash 

white='#f8f8f2'
gray='#44475a'
dark_gray='#282a36'
light_purple='#bd93f9'
dark_purple='#6272a4'
cyan='#8be9fd'
green='#50fa7b'
orange='#ffb86c'
red='#ff5555'
pink='#ff79c6'
yellow='#f1fa8c'

function cpu() {
	# Logic borrowed from https://github.com/dracula/tmux
	local cpuvalue=$(ps -A -o %cpu | awk -F. '{s+=$1} END {print s}')
	local cpucores=$(sysctl -n hw.logicalcpu)
	local cpuusage=$((cpuvalue / cpucores))
	printf "#[fg=$1]#[fg=$2]#[bg=$1]   %02d%% #[bg=$1]" "${cpuusage}"
}

function battery() {
	local status=$(pmset -g batt | sed -n 2p | cut -d ';' -f 2 | tr -d " ")
	local batt=$(pmset -g batt | grep -Eo '[0-9]?[0-9]?[0-9]%')
	local percentage=$(printf "%03s" $batt)
	local chargingMap=("" "" "" "" "" "" "" "" "" "")
	local chargedMap=("" "" "" "" "" "" "" "" "" "")
	local icon=""
	if [[ $status == "charging" ]]; then
		if [[ $percentage == "100%" ]]; then
			icon=""
		else
			icon=${chargingMap[${percentage:0:1}]}
		fi
	else 
		if [[ $percentage == "100%" ]]; then
			icon=""
		else
			icon=${chargedMap[${percentage:0:1}]}
		fi
	fi
	printf "#[fg=$1]#[fg=$2]#[bg=$1] %s %s #[bg=$1]" "${icon}" "${percentage}"
}

function mrwatson() {
	local status=""
	if [[ "$(watson status)" == "No project started." ]]; then
		status=""
	fi
	local total=$(watson report -dcG | grep 'Total:' | sed 's/Total: //')
	printf "#[fg=$1]#[fg=$2]#[bg=$1] %s %s #[bg=$1]" "${status}" "${total}"
}

function node_npm_version() {
	local node_version=$(node --version | sed -e 's/v//g')
	local npm_version=$(npm --version)
	printf "#[fg=$1]#[fg=$2]#[bg=$1]  %s  %s #[bg=$1]" "${node_version}" "${npm_version}"
}

function datetime() {
	printf "#[fg=$1]#[fg=$2]#[bg=$1]   %s " "$(date +'%h-%d %I:%M %p')"
}

function spotify() {
	# TODO - This doesn't work yet...
	printf "#[fg=$1]#[fg=$2]#[bg=$1] ♫ #{music_status} #{artist}: #{track} #[bg=$1]"
}

function main() {
	cpu "$pink" "$dark_gray"
	battery "$orange" "$dark_gray"
	node_npm_version "$yellow" "$dark_gray"
	mrwatson "$green" "$dark_gray"
	datetime "$light_purple" "$dark_gray"
	printf " "
}

main


