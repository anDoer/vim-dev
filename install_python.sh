#!/bin/bash 

sudo apt-get install -y python3-minimal python3-pip nodejs npm 
sudo -H python3 -m pip install --upgrade pip
python3 -m pip install --user --upgrade pynvim
python3 -m pip install --user jedi-language-server

# install packages as non-root user 
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

# extend bashrc 
echo 'NPM_PACKAGES="${HOME}/.npm-packages"' >> ~/.bashrc 
echo 'export PATH="$PATH:$NPM_PACKAGES/bin"' >> ~/.bashrc
source ~/.bashrc 

npm install -g yarn
