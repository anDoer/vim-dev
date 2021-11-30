#!/bin/bash 

sudo apt-get upgrade 
sudo apt-get install -y python3-minimal python3-pip nodejs npm
sudo -H python3 -m pip install --upgrade pip 
python3 -m pip install --user --upgrade pynvim 
python3 -m pip install --user jedi-language-server
npm install -g yarn
