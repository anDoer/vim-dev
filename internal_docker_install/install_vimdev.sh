#!/bin/bash 

# This file takes as parameters:
# 1) the desired user name configured in the docker container 
# 2) the vim installation directory
# 3) the current PATH variable 
echo $#
    if [ "$#" -ne "3" ]
then 
    echo "$0 requires the following arguments: USERNAME PATH_VARIABLE"
    exit -1
fi

USERNAME=$1 
PATH=$2 
VIMDEV_PATH=$3

export NPM_PACKAGES=/home/$USERNAME/.npm-packages 
export PATH=/home/$USERNAME/.npm-packages/bin:$PATH 
echo "export NPM_PACKAGES=/home/$USERNAME/.npm-packages" >> /home/$USERNAME/.bashrc
echo "export PATH=/home/$USERNAME/.npm-packages/bin:$PATH" >> /home/$USERNAME/.bashrc 
echo "alias vim='nvim'" >> /home/$USERNAME/.bashrc 

bash $VIMDEV_PATH/install_python_docker.sh /home/$USERNAME

