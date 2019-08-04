

echo "Installing Homebrew and apps"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew cask install iterm2

brew install wget

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

brew install markdown
brew install cmatrix
brew install the_silver_searcher
brew install ranger
brew install trash
brew install tree

