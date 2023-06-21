# zmodload zsh/zprof # top of your .zshrc file

export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME=""
ZSH_DISABLE_COMPFIX=true

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
# git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

plugins=(
  git
  npm
  # z
  node
  brew
  zsh-autosuggestions
  fast-syntax-highlighting
  zsh-history-substring-search
  # vi-mode
  zsh-vi-mode
  fzf
)

source $ZSH/oh-my-zsh.sh

# brew install pure
# autoload -U promptinit; promptinit
# prompt pure

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# https://gist.github.com/reegnz/b9e40993d410b75c2d866441add2cb55
function jqf() {
  echo "" | \
    fzf \
      --disabled \
      --print-query
      --preview "jq -C {q} $1" \
      --prompt="Query  " \
      --header="Interactive jq playground" \
      --preview-window="down:90"
}
function tzf() {
  tz -list | fzf -m | awk '{print $4}' | tr "\n" ";" | xargs -I {} sh -c "TZ_LIST='{}' tz"
}
function ghpr() {
  GH_FORCE_TTY=100% gh pr list | fzf --query "$1" --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout -f  
}
function ghgist() {
  GH_FORCE_TTY=100% gh gist list --limit 20 | fzf --ansi --preview 'GH_FORCE_TTY=100% gh gist view {1}' --preview-window down | awk '{print $1}' | xargs gh gist edit
}

# git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/AstroNvim
# git clone git@github.com:nvim-lua/kickstart.nvim.git ~/.config/kickstart
# git clone https://github.com/NvChad/NvChad ~/.config/NvChad --depth 1
# git clone https://github.com/LazyVim/starter ~/.config/LazyVim
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
bindkey -s ^a "nvims\n"

# bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^f "zellij-switch\n"

alias zz="zellij-switch"
alias cbr='git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff {1} --color=always" --pointer="" | xargs git checkout'
alias weather="curl -4 wttr.in/nashville"
alias rob="say 'How many Lowes could Rob Lowe rob if Rob Lowe could rob Lowes?'"
alias git-init-commit="git reset $(git commit-tree HEAD^{tree} -m 'Initial commit')"
alias ls="exa"
alias ll="exa --long --header --git --icons"
alias tree="ll --tree --level=4 -a -I=.git --git-ignore"
alias yw="yarn workspace"
alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias zshrcs="source ~/.zshrc"
alias vimrc="vim ~/.config/nvim/init.vim"
alias vimrcs="source ~/.config/nvim/init.vim"
alias tmuxrc="vim ~/.tmux.conf"
alias tmuxrcs="tmux source-file ~/.tmux.conf"
alias cb='git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout'
alias beep='echo -e "\a"'
# npm i play-sound-cli -g
alias yo='play-sound ~/manorisms/mp3s/hour_chime.mp3'
alias tada='play-sound ~/manorisms/mp3s/tada.mp3'
# npm i -g node-notifier-cli
alias alert='notify -t "Status" -m "Finished" -s Glass'
alias status='notify -t "Status" -m "$([ $? = 0 ] && echo Good News || echo Bad News)"'
alias zpacker='cd ~/.local/share/nvim/site/pack/packer/start'
# taken from https://twitter.com/davidcrespo/status/1492958857479532549
alias ghpr-oldest='gh pr list | fzf --height 20% --reverse | cut -f1 | xargs gh pr checkout -f'
alias ghpr-older='gh pr list | fzf-tmux --reverse --preview "gh pr view {1}" | cut -f1 | xargs gh pr checkout -f'
alias ghpr-old='gh pr list | fzf --reverse --preview-window down,75%,border-horizontal --preview "gh pr view {1}" | cut -f1 | xargs gh pr checkout -f'
alias ghpr-noworky="GH_FORCE_TTY=100% gh pr list | fzf --ansi --header-lines 3 --preview 'GH_FORCE_TTY=$FZF_PREVIEW_COLUMNS gh pr view {1}' --preview-window down,border-horizontal | awk '{print $1}' | xargs gh pr checkout"
alias v='fd --type f --hidden --follow --exclude .git | fzf-tmux -p --reverse | xargs nvim'
local dev_commands=(
	'tz' 'task' 'watson' 'archey' 'ncdu'
	'fkill' 'lazydocker' 'ntl' 'ranger'
	'speed-test' 'serve' 'vtop' 'htop' 'btop' 
	'lazygit' 'gitui' 'tig' 'tldr'
)
alias dev='printf "%s\n" "${dev_commands[@]}" | fzf --height 20% --header Commands | xargs bash'
alias xkcd="kitty +kitten icat $(curl -s https://xkcd.com/ | sed -En 's/<meta property=\"og:image\" content=\"([^\"]+)\">/\1/p')"
alias xkcdf="f() { echo "$1" && kitty +kitten icat $(curl -s "https://xkcd.com/$1" | sed -En 's/<meta property=\"og:image\" content=\"([^"]+)\">/\1/p') }; f"
alias xkcdt="f() { echo $1 };f"
alias example='f() { echo Your arg was $1. };f'
alias lksconfig='vim ~/.lks/config.json'
alias python=/usr/local/bin/python3.9
alias yarntest="yarn ui:build && yarn lerna run test --concurrency 4 --parallel --ignore server && yarn workspace server test && yarn coverage:collect"

function time-zsh() {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}
function time-zsh-plugins() {
  # brew install coreutils
  for plugin ($plugins); do
    timer=$(($(gdate +%s%0N)/1000000))
    if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then
      source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh
    elif [ $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
      source $ZSH/plugins/$plugin/$plugin.plugin.zsh
    fi
    now=$(($(gdate +%s%0N)/1000000))
    elapsed=$(($now-$timer))
    echo $elapsed":" $plugin
  done
}
function shorten() {
  node ~/manorisms/open-source/etm.im/node_modules/.bin/netlify-shortener "$1" "$2"
}

export GIT_EDITOR='nvim'
export VISUAL='nvim'
export EDITOR='nvim'
export TMUXP_CONFIGDIR=$HOME/.config/tmuxp
export DISABLE_AUTO_TITLE='true'
export PATH=/Users/$USER/bin:$HOME/go/bin:/Users/$USER/.local/share/bob/nvim-bin:$PATH
export TERM=xterm-256color

export TZ_LIST="US/Central;Asia/Kolkata;"

eval "$(fnm env --use-on-cd --log-level=quiet)"

[ -r ~/private/.zshrc ] && source ~/private/.zshrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/marcduiker.omp.json)"


