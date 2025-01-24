#!/bin/bash
DIR=$(pwd)

# sudo pacman -Syu
sudo pacman -S zsh curl git tmux \
    the_silver_searcher cmake \
    python ruby xclip neovim \
    ack python-pip ripgrep ruby-devel \
    nodejs go fzf difftastic sed \
    neofetch kitty htop ranger -y

yay -S npm yarn tldr sublime-merge kmon-git diskonaut

# for i3
sudo pacman -S flameshot -y
yay -S xkb-switch light-git

# for mac only
# coreutils for tmux stats
brew install coreutils

# install neovim, lsp-tsserver, efm-langserver, eslint_d, prettier
npm install -g neovim typescript typescript-language-server eslint_d prettier

# neovim dependencies
python3 -m pip install --user --upgrade pynvim
gem install neovim

# setup ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clean up previous config
rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig ~/.config/nvim* ~/.bash_aliases ~/config/kitty ~/config/efm-langserver ~/.config/i3

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.config

# packer for nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

### add config files ###
ln -s $DIR/config/nvim ~/.config/nvim
ln -s $DIR/config/i3 ~/.config/i3
ln -s $DIR/config/kitty ~/.config/kitty
ln -s $DIR/config/conky ~/.config/conky
ln -s $DIR/config/efm-langserver ~/.config/efm-langserver
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.bash_aliases ~/.bash_aliases
ln -s $DIR/profile-scripts ~/profile-scripts
