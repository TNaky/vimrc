#!/bin/sh
mkdir -p ${HOME}/.vim
git clone https://github.com/TNaky/vimrc.git ${HOME}/.vim/vimrc
ln -s ${HOME}/.vim/vimrc/.vimrc ${HOME}/.vimrc
