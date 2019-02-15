#!/bin/bash

$ZSH_PATH="$HOME/.oh-my-zsh/custom"

sudo apt-get install -y git zsh wget curl
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Plugin: zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PATH/zsh-syntax-highlighting

# Install Plugin: zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_PATH/zsh-autosuggestions

# Replace profile
wget https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/zsh-installer/.zshrc -O ~/.zshrc

# Enable changes
source ~/.zshrc
echo "Finish."