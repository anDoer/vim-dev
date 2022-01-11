if [ "$#" -ne 2 ]
then 
    echo "$0 requires arguments: user path_variable"
    exit -1
fi 

USERNAME=$1
PATH=$2 

cp /etc/sudoers /etc/sudoers.bak 
usermod -aG sudo $USERNAME 
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

su - $USERNAME -c ./install_vimdev.sh 

deluser $USERNAME sudo
mv /etc/sudoers.bak /etc/sudoers 
