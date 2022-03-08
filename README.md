# vim-dev
My configuration to turn neovim into an ide with python support 

## Installation
To install nvim-plugins with support for CoC and python, run 
```
./install_python.sh
./install.sh
```

## Docker
To play around with a demo inside a docker container, simply run 
```
./build_docker.sh
```
and to enter the container to play around, run 
```
./enter_docker.sh
``` 

There are two ways to run vim-dev inside a docker container:
1) Keeping vim-dev outside of your container, you can use __external_docker_install__ as used in __build_docker.sh__ 
2) Directly cloning this repository inside your docker container and run an __internal_docker_install__ similar to 
```
# sample docker building script 
cp Dockerfile Dockerfile.bkp 
USERNAME=user 

# add user with your current users UID
echo "RUN adduser --disabled-password --gecos \"\" -u $UID $USERNAME"  >> Dockerfile
echo "WORKDIR /home/$USERNAME" >> Dockerfile 

# clone vim-dev into desired location
echo "RUN git clone https://github.com/anDoer/vim-dev.git /home/$USERNAME/vim-dev" >> Dockerfile
echo "WORKDIR /home/$USERNAME/vim-dev" >> Dockerfile

# Installation needs to be performed as root user
echo "USER root" >> Dockerfile

# Add location of your miniconda3 installation *inside* your container
PATH="/opt/miniconda3/bin:$PATH"
# running the internal installation script with parameters $USERNAME $PATH_VARIABLE $VIMDEV_PATH 
echo "RUN bash internal_docker_install/install.sh $USERNAME $PATH /home/$USERNAME/vim-dev/" >> Dockerfile

echo "USER $USERNAME" >> Dockerfile
echo "WORKDIR /home/$USERNAME/eval" >> Dockerfile 

mv Dockerfile.bkp Dockerfile
```

