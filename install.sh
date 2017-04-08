#!/bin/bash

source $(dirname $0)/common.sh

# install homebrew
if ! exists brew; then
  yes | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install anyenv
if ! [ -d ~/.anyenv ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

# install zsh
if ! [ -f /usr/local/bin/zsh ]; then
  brew install zsh
fi

# change defalut shell
if ! fgrep $(which zsh) /etc/shells >/dev/null 2>&1; then
  echo $(which zsh) | sudo tee -a /etc/shells
fi
shell=$(dscl localhost -read Local/Default/Users/$USER UserShell | cut -d' ' -f2)
if [ "$shell" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
fi
export SHELL=$(which zsh)

# copy dotfiles
for file in .zshrc .zshrc.custom .zplug .config .gitconfig .tmux.conf .ctags
do
  rm -rf $HOME/$file
  ln -s $PWD/$file $HOME/$file
done

echo Please restart your terminal.
exit
