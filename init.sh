#!/bin/bash
DIR=$(pwd)

# sudo pacman -Syu
sudo pacman -S zsh curl git tmux \
	the_silver_searcher cmake \
	python ruby xclip neovim \
	ack python-pip ripgrep \
	nodejs go fzf diff-so-fancy \
	neofetch kitty htop ranger -y

yay -S npm yarn tldr sublime-merge kmon-git diskonaut

# install neovim, lsp-tsserver, efm-langserver, eslint_d, prettier
npm install -g neovim typescript typescript-language-server eslint_d prettier
go get github.com/mattn/efm-langserver

# neovim dependencies
python3 -m pip install --user --upgrade pynvim
gem install neovim

# setup ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clean up previous config
rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig ~/.config/nvim* ~/.bash_aliases ~/config/kitty ~/config/efm-langserver

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.config

# vim-plug for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### add config files ###
ln -s $DIR/config/nvim ~/.config/nvim
ln -s $DIR/config/kitty ~/.config/kitty
ln -s $DIR/config/efm-langserver ~/.config/efm-langserver
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.bash_aliases ~/.bash_aliases
