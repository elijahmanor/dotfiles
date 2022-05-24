export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME=""
ZSH_DISABLE_COMPFIX=true

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

plugins=(
  git
  npm
  z
  node
  brew
  zsh-autosuggestions
  fast-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# brew install pure
autoload -U promptinit; promptinit
prompt pure

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

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

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
alias ghpr='gh pr list | fzf --height 20% --reverse | cut -f1 | xargs gh pr checkout -f'
# alias dev="printf '%s\n' 'lazygit' 'task' 'tz' 'watson log -wGc' 'watson report -dcG' | fzf --height 20% --header Commands | bash"
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

export GIT_EDITOR='nvim'
export VISUAL='nvim'
export EDITOR='nvim'
export TMUXP_CONFIGDIR=$HOME/.config/tmuxp
export DISABLE_AUTO_TITLE='true'
export PATH=/Users/$USER/bin:$HOME/go/bin:$PATH
export TERM=xterm-256color

export NNN_PLUG=''
export NNN_FCOLORS='0000E6310000000000000000'
export NNN_FIFO=/tmp/nnn.fifo
alias nnn='nnn -e'

export TZ_LIST="US/Eastern;Europe/London;Europe/Berlin;Europe/Stockholm;Israel;Asia/Kolkata,India;"

eval "$(fnm env)"

[ -r ~/private/.zshrc ] && source ~/private/.zshrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# begin lks completion
. <(lks --completion)
# end lks completion

[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH (Rich Enchanced Shell History)
