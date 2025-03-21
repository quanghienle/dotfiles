# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

#foobar() {
#  neofetch | lolcat
#}

#foobar

# neofetch --ascii_distro arch | lolcat
# neofetch | lolcat

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"

#cmatrix

# add 'globalias' for alias expansion
plugins=(
   git 
   shrink-path
   colored-man-pages
   macos
   zsh-vi-mode
   zsh-syntax-highlighting
)

export EDITOR='vim'
DISABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions.zsh
source ~/.zsh/aliases
source ~/.zsh/functions
# source ~/.zsh/prompt
source ~/.zsh/history
source ~/.zsh/key-bindings
source /Users/u1117687/Documents/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

set -o emacs

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
alias luamake=/Users/u1117687/Documents/dotfiles/nvim/lua-language-server/3rd/luamake/luamake


# Load Angular CLI autocompletion.
source <(ng completion script)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
