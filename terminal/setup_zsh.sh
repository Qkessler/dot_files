#!/bin/bash

# Check for the OS running this script.
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ $machine == "Mac"]; then
    alias install_zsh='brew install zsh'
    alias install_curl='brew install curl'
elif [$machine == "Linux"]; then
    alias install_zsh='sudo apt install zsh'
    alias install_curl='sudo apt install curl'
else
    echo "Cannot install zsh on the running machine: $machine"
fi

# Setup zsh
install_zsh
chsh -s $(which zsh)

# Setup oh-my-zsh!
install_curl
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup zsh plugins: autosuggestions, syntax-highlighting

## zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Setup the spaceship-theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "Everything has been set up."
echo "Please make sure the .zshrc has been populated after the stow command."
