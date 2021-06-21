# dotfiles
========

## Install Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Clone this Repo

```
git clone git@github.com:thnukid/dotfiles.git ~/.dotfiles
```

## List Files

```
tree -a -I '.git|.DS_Store'
```

## Install Packages

```
brew bundle
```

### Symlink dotfiles

```
stow bin kitty nvim tmux zsh
```

