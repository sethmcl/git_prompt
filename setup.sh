#!/bin/bash
cd ~
DOTFILES_DIR=~/git_prompt

function doIt() {
  # install antigen (zsh plugin manager)
  curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh

  # setup symlinks
  ln -sfv {$DOTFILES_DIR/,./}.zshrc

  # change shell to zsh
  chsh -s /bin/zsh
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This will override ~/.zshrc. Continue? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
