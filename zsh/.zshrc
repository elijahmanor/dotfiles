export ZSH="/Users/emanor/.oh-my-zsh"

ZSH_THEME=""
ENABLE_CORRECTION="false"

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins=(git npm z node brew zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

function shorten() {
  node ~/manorisms/open-source/etm.im/node_modules/.bin/netlify-shortener "$1" "$2"
}

alias weather="curl -4 wttr.in/nashville"
alias rob="say 'How many Lowes could Rob Lowe rob if Rob Lowe could rob Lowes?'"
alias git-init-commit="git reset $(git commit-tree HEAD^{tree} -m 'Initial commit')"

alias vim="nvim"
alias zshrc="vim ~/.zshrc"
alias zshrcs="source ~/.zshrc"
alias vimrc="vim ~/.config/nvim/init.vim"
alias vimrcs="source ~/.config/nvim/init.vim"
alias batvimrc="bat ~/.config/nvim/init.vim"
alias tmuxrc="vim ~/.tmux.conf"
alias tmuxrcs="tmux source-file ~/.tmux.conf"
alias myhelp="vim ~/.vim/plugged/vim-myhelp/doc/myhelp.txt"
alias cb='git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout'

alias beep='echo -e "\a"'
# npm i play-sound-cli -g
alias yo='play-sound ~/manorisms/mp3s/hour_chime.mp3'
# npm i -g node-notifier-cli
alias alert='notify -t "Status" -m "Finished" -s Glass'
alias status='notify -t "Status" -m "$([ $? = 0 ] && echo Good News || echo Bad News)"'

export GIT_EDITOR='vim'
export VISUAL='vim'
export EDITOR='vim'

# alias hub to git
eval "$(hub alias -s)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use v14 --silent

export PATH=/Users/emanor/bin:$PATH

[ -r ~/private/.zshrc ] && source ~/private/.zshrc



# begin lks completion
. <(lks --completion)
# end lks completion
