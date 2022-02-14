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
	cpuvalue=$(ps -A -o %cpu | awk -F. '{s+=$1} END {print s}')
	cpucores=$(sysctl -n hw.logicalcpu)
	cpuusage=$((cpuvalue / cpucores ))
	printf "#[fg=$1]#[fg=$2]#[bg=$1]   %s%% #[bg=$1]" "${cpuusage}"
}

function battery() {
	printf "#[fg=$1]#[fg=$2]#[bg=$1]  %s #[bg=$1]" "$(pmset -g batt | grep -Eo '[0-9]?[0-9]?[0-9]%')"
}

function mrwatson() {
	printf "#[fg=$1]#[fg=$2]#[bg=$1]  %s #[bg=$1]" "$(watson report -dcG | grep 'Total:' | sed 's/Total: //')"
}

function node_npm_version() {
	printf "#[fg=$1]#[fg=$2]#[bg=$1]  %s  %s #[bg=$1]" "$(node --version | sed -e 's/v//g')" "$(npm --version)"
}

function datetime() {
	printf "#[fg=$1]#[fg=$2]#[bg=$1]  %s " "$(date +'%h-%d %I:%M %p')"
}

function spotify() {
	printf "#[fg=$1]#[fg=$2]#[bg=$1] ♫ #{music_status} #{artist}: #{track} #[bg=$1]"
}

function main() {
	cpu "$pink" "$dark_gray"
	# battery "$orange" "$dark_gray"
	node_npm_version "$yellow" "$dark_gray"
	mrwatson "$green" "$dark_gray"
	datetime "$light_purple" "$dark_gray"
	printf " "
}

main


