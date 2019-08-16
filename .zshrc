# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"

# Themes found in: /Users/hien.le/.oh-my-zsh/themes
#ZSH_THEME="my-theme"

# add 'globalias' for alias expansion
plugins=(
   git 
   lein
   shrink-path
   colored-man-pages
   zsh-syntax-highlighting
)

#export EDITOR="/usr/local/bin/mate -w"
export EDITOR='vim'
#setopt correct
DISABLE_CORRECTION="true"

#zstyle ’:completion:*:cd:*’ ignore-parents parent pwd

#for f in  ~/.zsh/*(DN); do source $f; done

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions.zsh
source ~/.zsh/aliases
source ~/.zsh/functions
source ~/.zsh/prompt
source ~/.zsh/history
source ~/.zsh/key-bindings

#bindkey -s '(' 'echo ()'

################ docker keychain ########################
if [ $(command -v docker-credential-osxkeychain) ]; then
    unlink $(command -v docker-credential-osxkeychain)
fi

################ NVM loading ########################  
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
