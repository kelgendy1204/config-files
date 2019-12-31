#!/bin/bash
DIR=$(pwd)

# setup zsh, tumx, oh my zsh, git, neovim and vim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install vim-gnome zsh curl git file tmux \
    silversearcher-ag build-essential cmake \
    python3-dev python-dev xclip locales dconf-tools\
    software-properties-common ack-grep \
    python-pip python3-pip neovim snapd -y

# Homebrew on Linux
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install ripgrep for file search
sudo snap install ripgrep --classic
brew install node

# Better diff
sudo npm install -g diff-so-fancy

# set local
locale-gen en_US.UTF-8

# setup ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clean up previous config
sudo rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig ~/.config/nvim* ~/.bash_aliases

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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
ln -s $DIR/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $DIR/.bash_aliases ~/.bash_aliases
