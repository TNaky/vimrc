#!/bin/sh
# OSを判定
OS=''
if [ `uname` = 'Darwin' ]; then
  OS='Mac'
elif [ `uname` = 'Linux' ]; then
  if `cat /etc/*-release | grep Ubuntu > /dev/null 2>&1`; then
    OS='Ubuntu'
  elif `cat /etc/*-release | grep Debian > /dev/null 2>&1`; then
    OS='Debian'
  fi
fi
echo $OS

# lua有効なVimがインストールされているか判定し，問題なければ，vimrcを配置します．
MESS=''
if `which vim > /dev/null 2>&1`; then
  if `vim --version | grep +lua > /dev/null 2>&1`; then
    # vimrcをgithubからクローンする
    mkdir -p ${HOME}/.vim
    git clone https://github.com/TNaky/vimrc.git ${HOME}/.vim/vimrc
    ln -s ${HOME}/.vim/vimrc/.vimrc ${HOME}/.vimrc
    vim
    exit
  else
    MESS="インストールされているVimがluaオプション未対応"
  fi
else
  MESS="Vimがインストールされていません"
fi

# luaが有効なVimがない場合，OSに即したインストール方法を示します．
echo $MESS
