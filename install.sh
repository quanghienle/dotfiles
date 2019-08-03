CWD=$(pwd)

echo "Backing up old files..."
mv -iv ~/.zshrc ~/.zshrc.old
mv -iv ~/.zsh ~/.zsh.old
mv -iv ~/.vimrc ~/.vimrc.old
mv -iv ~/.vim ~/.vim.old

echo "Adding symlinks..."
ln -sfnv $CWD/.zshrc ~/.zshrc
ln -sfnv $CWD/.zsh ~/.zsh
ln -sfnv $CWD/.vimrc ~/.vimrc
ln -sfnv $CWD/.vim ~/.vim

echo "Done."

