#!/bin/bash 


sudo apt-get update 
sudo apt-get install -y python3 python3-pip nodejs npm neovim tmux 
#python3 -m pip install pynvim 

#sudo -H python3 -m pip install --upgrade pip 
#python3 -m pip install --user --upgrade pynvim 
#python3 -m pip install --user jedi-language-server 

#echo "alias vi='nvim'" >> ~/.bashrc 
#echo "alias vim='nvim'" >> ~/.bashrc 

#mkdir ~/.npm-global 
#npm config set prefix '~/npm-global' 
#npm install -g yarn 
##################3
# install neovim and tmux 
#sudo apt-get -y install neovim tmux

# create aliases 
#echo "alias vi='nvim'" >> ~/.bashrc 
#echo "alias vim='nvim'" >> ~/.bashrc 
#source ~/.bashrc

# generate nvim config folder 
#mkdir -p ~/.config/nvim 
#touch ~/.config/nvim/init.vim

# install python for Conquer of Completion Plugin
#sudo apt-get install -y python3 nodejs npm
#sudo -H python3 -m pip install --upgrade pip 
#python3 -m pip install --user --upgrade pynvim
#python3 -m pip install -U jedi-language-server

# for ubuntu 18: add nodejs apt 
#curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
#sudo apt-get update 
#sudo apt-get install -y nodejs


# generate local npm config 
#mkdir ~/.npm-global

#npm config set prefix '~/.npm-global'
#npm install -g yarn 

# In order to add support for different languages:
# https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

# copy config 
#cp nvim_config.vim ~/.config/nvim/init.vim
