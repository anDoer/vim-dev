if [ "$#" -ne 3 ]
then 
    echo "$0 requires arguments: user path_variable"
    exit -1
fi 

USERNAME=$1
PATH=$2 
$VIMDEV_PATH=$3

cp /etc/sudoers /etc/sudoers.bak 
usermod -aG sudo $USERNAME 
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers 

su - $USERNAME -c "$VIMDEV_PATH/internal_docker_install/install_vimdev.sh $USERNAME $PATH $VIMDEV_PATH" 

bash $VIMDEV_PATH/install.sh

nvim --headless +PlugInstall +qall
nvim --headless +'CocInstall -sync coc-snippets' +qall
nvim --headless +'CocInstall -sync coc-prettier' +qallDOCKERFILE
nvim --headless +'CocInstall -sync coc-jedi' +qall
nvim --headless +'CocInstall -sync coc-highlight' +qall
nvim --headless +'CocInstall -sync coc-eslint' +qall
nvim --headless +'CocInstall -sync coc-json' +qall
nvim --headless +'CocInstall -sync coc-git' +qall
nvim --headless +'CocUpdateSync' +qall


deluser $USERNAME sudo
mv /etc/sudoers.bak /etc/sudoers 
