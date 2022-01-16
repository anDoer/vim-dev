if [ "$#" -ne 3 ]
then 
    echo "$0 requires arguments: user path_variable"
    exit -1
fi 

USERNAME=$1
PATH=$2 
VIMDEV_PATH=$3

cp /etc/sudoers /etc/sudoers.bak 
usermod -aG sudo $USERNAME 
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

su - $USERNAME -c "$VIMDEV_PATH/internal_docker_install/install_vimdev.sh $USERNAME $PATH $VIMDEV_PATH" 

#su - $USERNAME -c "cd $VIMDEV_PATH && bash $VIMDEV_PATH/install.sh"

deluser $USERNAME sudo
mv /etc/sudoers.bak /etc/sudoers 
