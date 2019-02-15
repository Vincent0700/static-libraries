#!/bin/bash

sudo apt-get install -y git zsh wget
chsh -s /bin/zsh

# Replace profile
wget https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/zsh-installer/.zshrc -O ~/.zshrc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source ~/.zshrc

# Install Plugin: zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/zsh-syntax-highlighting

# Install Plugin: zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/zsh-autosuggestions

# Enable changes
source ~/.zshrc
echo "Finish."