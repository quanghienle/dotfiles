

echo "Installing Homebrew and apps"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget

brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew install markdown
brew install cmatrix
brew install the_silver_searcher
brew install ranger
brew install trash
brew install tree

