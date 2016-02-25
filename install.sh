#!/bin/sh
# OSを判定
OS=''
if [ `uname` = 'Darwin' ]; then
  OS='Mac'
elif [ `uname` = 'Linux' ]; then
  if [ `cat /etc/*-release | grep Ubuntu 2>&1 /dev/null; echo $?` ]; then
    OS='Ubuntu'
  elif [ `cat /etc/*-release | grep Debian 2>&1 /dev/null; echo $?` ]; then
    OS='Debian'
  fi
fi
echo $OS

# vimrcをgithubからクローンする
mkdir -p ${HOME}/.vim
git clone https://github.com/TNaky/vimrc.git ${HOME}/.vim/vimrc
ln -s ${HOME}/.vim/vimrc/.vimrc ${HOME}/.vimrc
vim
