export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_CUSTOM/zsh-autosuggestions/zsh-autosuggestions.zsh