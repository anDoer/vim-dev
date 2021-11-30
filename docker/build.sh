#!/bin/bash 

cp Dockerfile Dockerfile.bkp

USERNAME=user 
echo "RUN adduser --disabled-password --gecos \"\" -u $UID $USERNAME"  >> Dockerfile
echo "RUN usermod -aG sudo $USERNAME" >> Dockerfile
echo "RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers" >> Dockerfile
echo "USER $USERNAME" >> Dockerfile
echo "WORKDIR /home/$USERNAME" >> Dockerfile

docker build --tag andoer/neovim . 

rm Dockerfile 
mv Dockerfile.bkp Dockerfile


