#!/bin/bash 

white='#f8f8f2'
gray='#44475a'
dark_gray='#282a36' # dracula
# dark_gray='#504945' # gruvbox-light
light_purple='#bd93f9'
dark_purple='#6272a4'
cyan='#8be9fd'
green='#50fa7b'
orange='#ffb86c'
red='#ff5555'
pink='#ff79c6'
yellow='#f1fa8c'

function segment() {
	powerline "${@}"
}

function powerline() {
	printf "#[fg=%s]#[fg=%s]#[bg=%s] %s #[bg=%s]" $1 $2 $1 "${3}" $1
}

function basicline() {
	printf "#[fg=%s]#[bg=%s] | %s" $1 $2 "${3}"
}

function twitter() {
	# local username = "@elijahmanor"
	# segment $1 $2 "${username}"
	printf "#[fg=$1]#[fg=$2]#[bg=$1] @elijahmanor #[bg=$1]"
}

function main() {
	twitter "$cyan" "$dark_gray"
	printf " "
}

main


