#!/bin/bash
set -e

version=1.0.0

echo ""
echo "[Sourcelist Switcher] version $version"
echo "repos: https://github.com/Vincent0700/static-libraries/tree/master/source/bestvim"
echo ""

reposUrl="https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/bestvim"
vimrc="$reposUrl/.vimrc"
file="~/.vimrc"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget -q -O $file $url;
vim +PluginInstall +qall
