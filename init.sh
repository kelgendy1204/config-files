#!/bin/bash
apt-get update
apt-get install vim-gnome -y

# setup zsh, oh my zsh and git
apt-get install zsh curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install tmux
apt-get install tmux

# clean up previous config
rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig ~/.config/nvim*

### add config files ###
ln -s ~/Dropbox/config-files/.zshrc ~/.zshrc

ln -s ~/Dropbox/config-files/.vimrc ~/.vimrc
ln -s ~/Dropbox/config-files/.vimplugins ~/.vimplugins
ln -s ~/Dropbox/config-files/.vimkeymapping ~/.vimkeymapping
ln -s ~/Dropbox/config-files/.vimsettings ~/.vimsettings

ln -s ~/Dropbox/config-files/init.vim ~/.config/nvim/init.vim

ln -s ~/Dropbox/config-files/.tmux.conf ~/.tmux.conf

ln -s ~/Dropbox/config-files/.gitconfig ~/.gitconfig
