#!/bin/bash
set -e

version=1.0.0

echo ""
echo "[BestVim] version $version"
echo "repos: https://github.com/Vincent0700/static-libraries/tree/master/source/bestvim"
echo ""

reposUrl="https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/bestvim"
vimrc="$reposUrl/.vimrc"
file="~/.vimrc"

vundlePath="~/.vim/bundle/Vundle.vim"
if [ ! -d $vundlePath ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $vundlePath
fi

wget -q -O $file $vimrc;
vim +PluginInstall +qall
