CWD=$(pwd)

echo -e "\u001b[33;1mBacking up old files...\u001b[0m"
mv -iv ~/.zshrc ~/.zshrc.old
mv -iv ~/.zsh ~/.zsh.old
mv -iv ~/.vimrc ~/.vimrc.old
mv -iv ~/.vim ~/.vim.old

echo -e "\u001b[36;1mAdding symlinks...\u001b[0m"
ln -sfnv $CWD/.zshrc ~/.zshrc
ln -sfnv $CWD/.zsh ~/.zsh
ln -sfnv $CWD/.vimrc ~/.vimrc
ln -sfnv $CWD/.vim ~/.vim

echo -e "\u001b[32;1mDone.\u001b[0m"

