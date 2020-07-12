#!/bin/bash
DIR=$(pwd)

# sudo pacman -Syu
sudo pacman -S gvim zsh curl git tmux \
    the_silver_searcher cmake \
    python ruby xclip neovim ack \
    python2-pip python-pip ripgrep fd nodejs \
    fzf diff-so-fancy neofetch gnome-terminal -y

yay -S npm yarn tldr++

# install neovim
sudo npm install -g neovim
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim
gem install neovim

# setup ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clean up previous config
rm -rf ~/.vim* ~/.zsh* ~/.tmux* ~/.gitconfig ~/.config/nvim* ~/.bash_aliases

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

# For i3, config and dependencies
sudo pacman -S i3 playerctl arandr feh lxappearance \
    rofi compton ttf-font-awesome alsa-utils acpi \
    sysstat

# For i3 yay dependencies
yay -S papirus-icon-theme kbdd-git

cp -r ./Pictures ~/Pictures

rm -rf ~/.config/i3 ~/.config/i3status ~/.config/rofi

mkdir -p ~/.config/i3blocks

ln -s $DIR/config/i3 ~/.config/i3
ln -s $DIR/config/i3status ~/.config/i3status
ln -s $DIR/config/rofi ~/.config/rofi
ln -s $DIR/config/i3blocks/config ~/.config/i3blocks/config

git clone https://github.com/vivien/i3blocks-contrib.git ~/.config/i3blocks/scripts
