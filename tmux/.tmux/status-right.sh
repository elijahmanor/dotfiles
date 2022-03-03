#!/bin/bash 

# cargo install bkt
bkt_ttl='15s'

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

function segment() {
	basicline "$@"
}

function powerline() {
	printf "#[fg=$1]#[fg=$2]#[bg=$1] $3 #[bg=$1]"
}

function basicline() {
	printf "#[fg=$1]#[bg=$2] | $3 "
}

function cpu() {
	# Logic borrowed from https://github.com/dracula/tmux
	local cpuvalue=$(bkt --ttl=$bkt_ttl -- ps -A -o %cpu | awk -F. '{s+=$1} END {print s}')
	local cpucores=$(bkt --ttl=$bkt_ttl -- sysctl -n hw.logicalcpu)
	local cpuusage=$((cpuvalue / cpucores))
	local slot=$(printf "  %02d%%" $cpuusage)
	segment $1 $2 "${slot}"
}

function battery() {
	local status=$(bkt --ttl=$bkt_ttl -- pmset -g batt | sed -n 2p | cut -d ';' -f 2 | tr -d " ")
	local batt=$(bkt --ttl=$bkt_ttl -- pmset -g batt | grep -Eo '[0-9]?[0-9]?[0-9]%')
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
	local slot=$(printf "%s %s" $icon $percentage)
	segment $1 $2 "${slot}"
}

function mrwatson() {
	local status=""
	if [[ "$(bkt --ttl=$bkt_ttl -- watson status)" == "No project started." ]]; then
		status=""
	fi
	local total=$(bkt --ttl=$bkt_ttl -- watson report -dcG | grep 'Total:' | sed 's/Total: //')
	local slot=$(printf "%s %s" "${status}" "${total}")
	segment $1 $2 "${slot}"
}

function node_npm_version() {
	local node_version=$(bkt --ttl=$bkt_ttl -- node --version | sed -e 's/v//g')
	local npm_version=$(bkt --ttl=$bkt_ttl -- npm --version)
	local slot=$(printf " %s  %s" $node_version $npm_version)
	segment $1 $2 "${slot}"
}

function datetime() {
	local dateTime=$(bkt --ttl=$bkt_ttl -- date +'%h-%d %I:%M %p')
	local slot=$(printf "  %s" "${dateTime}")
	segment $1 $2 "${slot}"
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


