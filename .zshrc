# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/mongodb/bin"

# Themes found in: /Users/hien.le/.oh-my-zsh/themes
#ZSH_THEME="my-theme"
ZSH_THEME="powerlevel10k/powerlevel10k"

############ POWERLEVEL THEME SETTINGS ##############
POWERLEVEL9K_MODE='awesome-fontconfig'
############ END- POWERLEVEL THEME SETTINGS #######

cmatrix

# add 'globalias' for alias expansion
plugins=(
   git 
   lein
   shrink-path
   colored-man-pages
   osx
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
#source ~/.zsh/prompt
source ~/.zsh/history
source ~/.zsh/key-bindings


################ docker keychain ########################
if [ $(command -v docker-credential-osxkeychain) ]; then
    unlink $(command -v docker-credential-osxkeychain)
fi

################ NVM loading ########################  
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
