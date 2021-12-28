#!/bin/bash 

# This file takes as parameters:
# 1) the desired user name configured in the docker container 
# 2) the vim installation directory
# 3) the current PATH variable 
echo $#
    if [ "$#" -ne "2" ]
then 
    echo "$0 requires the following arguments: USERNAME PATH_VARIABLE"
    exit -1
fi

USERNAME=$1 
PATH=$2 

# Backup sudoers file 
echo "RUN cp /etc/sudoers /etc/sudoers.bak" >> Dockerfile 

# Add user to sudoers 

echo "RUN usermod -aG sudo $USERNAME" >> Dockerfile
echo "RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers" >> Dockerfile
echo "USER $USERNAME" >> Dockerfile

echo "WORKDIR /home/$USERNAME/vim_install" >> Dockerfile
echo "COPY install_python_docker.sh /home/$USERNAME/vim_install/install_python_docker.sh" >> Dockerfile
echo "COPY install.sh /home/$USERNAME/vim_install/install.sh" >> Dockerfile
echo "COPY configs /home/$USERNAME/vim_install/configs">> Dockerfile
echo "ENV NPM_PACKAGES /home/$USERNAME/.npm-packages" >> Dockerfile
# We need to include miniconda as well!
echo "ENV PATH /home/$USERNAME/.npm-packages/bin:$PATH" >> Dockerfile

echo "RUN ./install_python_docker.sh" >> Dockerfile
echo "RUN ./install.sh" >> Dockerfile
echo "RUN echo alias vim='nvim'" >> Dockerfile
echo "RUN nvim --headless +PlugInstall +qall" >> Dockerfile 
echo "RUN nvim --headless +'CocInstall -sync coc-snippets' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-prettier' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-jedi' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-highlight' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-eslint' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-json' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-git' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocUpdateSync' +qall" >> Dockerfile

# Remove user from sudoers 
echo "USER root" >> Dockerfile
echo "RUN deluser $USERNAME sudo" >> Dockerfile 
echo "RUN mv /etc/sudoers.bak /etc/sudoers" >> Dockerfile
