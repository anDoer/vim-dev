#!/bin/bash 

HOME_FOLDER=${1:-$HOME}

sudo apt-get update

# make sure,  we install the latest version of neovim
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim

# we need to add current version of nodejs -> ubuntu 20.04 does not offer latest versions 
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs 

pip install --upgrade pynvim pygls
conda install -y jedi 

# install packages as non-root user 
mkdir "${HOME_FOLDER}/.npm-packages"
npm config set prefix "${HOME_FOLDER}/.npm-packages"

# extend bashrc 
echo 'NPM_PACKAGES="${HOME_FOLDER}/.npm-packages"' >> ~/.bashrc 
echo 'export PATH="${PATH}:${NPM_PACKAGES}/bin"' >> ~/.bashrc
source ~/.bashrc 

npm install -g yarn

