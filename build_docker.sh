#!/bin/bash 

cp Dockerfile Dockerfile.bkp

USERNAME=user 
echo "RUN adduser --disabled-password --gecos \"\" -u $UID $USERNAME"  >> Dockerfile

PATH="/opt/miniconda3/bin:$PATH" 

###########################################
./build_nvim_docker.sh $USERNAME $PATH    
###########################################

docker build --tag andoer/neovim . 

rm Dockerfile 
mv Dockerfile.bkp Dockerfile


