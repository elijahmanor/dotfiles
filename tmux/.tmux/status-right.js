#!/usr/bin/env node

const { promisify } = require('util');
const exec = promisify(require('child_process').exec);
const run = async command => {
	const { stdout } = await exec(command);
	return stdout.toString().trim();
};

const colors = {
	white:'#f8f8f2',
	gray:'#44475a',
	dark_gray:'#282a36',
	light_purple:'#bd93f9',
	dark_purple:'#6272a4',
	cyan:'#8be9fd',
	green:'#50fa7b',
	orange:'#ffb86c',
	red:'#ff5555',
	pink:'#ff79c6',
	yellow:'#f1fa8c'
};

async function cpu(bg, fg=colors.dark_gray) {
	// Logic borrowed from https://github.com/dracula/tmux
	const value = parseFloat(await run("ps -A -o %cpu | awk -F. '{s+=$1} END {print s}'"));
	const scores = parseFloat(await run("sysctl -n hw.logicalcpu"));
	const usage = parseInt(value / scores).toString().padStart(2, "0");
	return `#[fg=${bg}]#[fg=${fg}]#[bg=${bg}]   ${usage}% #[bg=${bg}]`;
}

async function battery(bg, fg=colors.dark_gray) {
	const status = await run("pmset -g batt | sed -n 2p | cut -d ';' -f 2 | tr -d ' '");
	const batt = await run("pmset -g batt | grep -Eo '[0-9]?[0-9]?[0-9]%'");
	const percentage = batt.padStart(3, "0");
	const chargingMap = ["", "", "", "", "", "", "", "", "", ""];
	const chargedMap = ["", "", "", "", "", "", "", "", "", ""];
	let icon = "";
	if (status === "charging") {
		icon = percentage === "100%" ? "" : chargingMap[percentage[0]];
	} else { 
		icon = percentage === "100%" ? "" : chargedMap[percentage[0]];
	}
	return `#[fg=${bg}]#[fg=${fg}]#[bg=${bg}] ${icon} ${percentage} #[bg=${bg}]`;
}

async function node_npm_version(bg, fg=colors.dark_gray) {
	const node_version = await run("node --version | sed -e 's/v//g'");
	const npm_version = await run("npm --version");
	return `#[fg=${bg}]#[fg=${fg}]#[bg=${bg}]  ${node_version}   ${npm_version} #[bg=${bg}]`;
}

async function mrwatson(bg, fg=colors.dark_gray) {
	let status = await run("watson status");
	status = status === "No project started." ? "" : "";
	const total = await run("watson report -dcG | grep 'Total:' | sed 's/Total: //'");
	return `#[fg=${bg}]#[fg=${fg}]#[bg=${bg}] ${status} ${total} #[bg=${bg}]`;
}

async function datetime(bg, fg=colors.dark_gray) {
	const date = await run("date +'%h-%d %I:%M %p'");
	return `#[fg=${bg}]#[fg=${fg}]#[bg=${bg}]   ${date}`; 
}

async function main() {
	let statusRight = "";
	statusRight += await cpu(colors.pink);
	statusRight += await battery(colors.orange);
	statusRight += await node_npm_version(colors.yellow);
	statusRight += await mrwatson(colors.green);
	statusRight += await datetime(colors.light_purple);
	console.log(statusRight);
}

main();
