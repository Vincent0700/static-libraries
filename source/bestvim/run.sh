#!/bin/bash
set -e

version=1.0.2

echo ""
echo "[BestVim] version $version"
echo "repos: https://github.com/Vincent0700/static-libraries/tree/master/source/bestvim"
echo ""

reposUrl="https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/bestvim"
vimrc="$reposUrl/.vimrc"
file="$HOME/.vimrc"

vundlePath="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d $vundlePath ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $vundlePath
fi

echo ""
echo "Get .vimrc from $vimrc"
wget -q -O $file $vimrc
vim +PluginInstall +qall
