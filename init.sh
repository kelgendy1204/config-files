#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"

apt-get update
apt-get install vim-gnome -y

# setup zsh, oh my zsh and git
apt-get install zsh curl git -y

# setup ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install tmux
apt-get install tmux

# install neovim
# apt-get install software-properties-common
# add-apt-repository ppa:neovim-ppa/stable
# apt-get update
# apt-get install neovim
# apt-get install python-dev python-pip python3-dev python3-pip

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# clean up previous config
rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig
# rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig ~/.config/nvim*

# Add directories for nvim
# mkdir -p ~/.config ~/.config/nvim

### add config files ###
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.vimplugins ~/.vimplugins
ln -s $DIR/.vimkeymapping ~/.vimkeymapping
ln -s $DIR/.vimsettings ~/.vimsettings
# ln -s $DIR/init.vim ~/.config/nvim/init.vim
