#!/bin/sh

echo "Mac OS Install Setup Script"

sudo -v
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

echo "Installing xcode..."
xcode-select --install

echo "Installing brew..."
if test ! $(which brew); then
	## Don't prompt for confirmation when installing homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
fi

brew upgrade
brew update
brew tap caskroom/cask

echo "Installing recipes from brew..."

brew install bat
brew install btop
brew install dooit
brew install exa
brew install fd
brew install fzf
brew install gdu
brew install gh
brew install git
brew install glow
brew install helix
brew install hyperfine
brew install jq
brew install kitty
brew install lazydocker
brew install lazygit
brew install lolcat
brew install newsboat
brew install ripgrep
brew install stow
brew install taskell
brew install tmux
brew install trash-cli
brew install tz
brew install viddy
brew install watson
brew install wezterm
brew install wifi-password
brew install zellij
brew install zoxide

# Install zap - this didn't work via script
# zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

echo "Installing node..."
brew install fnm
fnm install v16.17
fnm use v16.17

echo "Installing node apps..."
npm install -g fkill-cli
npm install -g @githubnext/github-copilot-cli
npm install -g npkill
brew install yarn

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing rust apps..."
cargo install bob-nvim
bob install stable
bob use stable

echo "Installing python..."
# brew install python3
#
echo "Installing python apps..."
# pip3 install --upgrade pip
# pip3 install --user pylint
# pip3 install --user flake8

echo "Installing GUI apps..."
brew install azure-data-studio
brew install meetingbar
brew install orbstack

echo "Brew clean up..."
brew cleanup

echo "Installing fonts..."
brew tap caskroom/fonts
brew install font-jetbrains-mono
brew install font-jetbrains-mono-nerd-font
brew install font-symbols-only-nerd-font

git config --global user.name 'Elijah Manor'
git config --global user.email 'elijah.manor@gmail.com'
git config --global credential.helper

echo "Installing tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing personal dotfiles..."
git clone https://github.com/elijahmanor/dotfiles.git ~/dotfiles
cd dotfiles

echo ""
echo "Done!"
