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
    MESS="正常にインストールされました"
  else
    MESS="インストールされているVimがluaオプション未対応"
    if [ $OS = 'Mac' ]; then
      MESS="$MESS\n  \033[93m  brew install lua\n  brew install vim --with-lua\033[0m"
    elif [ $OS = 'Ubuntu' -o $OS = 'Debian' ]; then
      MESS="$MESS\n  \033[93m  sudo aptitude install -y vim-nox\033[0m"
    fi
  fi
else
  MESS="Vimがインストールされていません"
  if [ $OS = 'Mac' ]; then
    MESS="$MESS\n  \033[93m  brew install lua\n  brew install vim --with-lua\033[0m"
  elif [ $OS = 'Ubuntu' -o $OS = 'Debian' ]; then
    MESS="$MESS\n  \033[93m  sudo aptitude install -y vim-nox\033[0m"
  fi
fi

# luaが有効なVimがない場合，OSに即したインストール方法を示します．
echo $MESS
