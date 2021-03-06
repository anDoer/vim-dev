#!/bin/bash 

HOME_FOLDER=${1:-$HOME}

sudo apt-get update
sudo apt-get install -y python3-minimal python3-pip 

# we need to add current version of nodejs -> ubuntu 20.04 does not offer latest versions 
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs 


sudo -H python3 -m pip install --upgrade pip
python3 -m pip install --user --upgrade pynvim pygls
python3 -m pip install --user jedi-language-server

# install packages as non-root user 
mkdir "${HOME_FOLDER}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

# extend bashrc 
echo 'NPM_PACKAGES="${$HOME_FOLDER}/.npm-packages"' >> ~/.bashrc 
echo 'export PATH="${PATH}:${NPM_PACKAGES}/bin"' >> ~/.bashrc
source ~/.bashrc 

npm install -g yarn

