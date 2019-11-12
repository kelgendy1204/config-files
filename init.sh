#!/bin/bash
DIR=$(pwd)

# setup zsh, tumx, oh my zsh, git, neovim and vim
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt-get install vim-gnome zsh curl git tmux \
    silversearcher-ag build-essential cmake \
    python3-dev python-dev xclip locales dconf-tools\
    software-properties-common ack-grep \
    python-pip python3-pip neovim fzf snapd -y

# install ripgrep for file search
snap install ripgrep --classic

# set local
locale-gen en_US.UTF-8

# setup ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# clean up previous config
rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig ~/.config/nvim*

# Add directories for nvim
mkdir -p ~/.config ~/.config/nvim

# vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim-plug for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### add config files ###
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.vimplugins ~/.vimplugins
ln -s $DIR/.vimkeymapping ~/.vimkeymapping
ln -s $DIR/.vimsettings ~/.vimsettings
ln -s $DIR/init.vim ~/.config/nvim/init.vim
ln -s $DIR/.bash_aliases ~/.bash_aliases
