#!/bin/bash 

./build_docker.sh

SRC_DIR="$PWD" 

docker run\
  --shm-size="2g"\
  -v "$SRC_DIR":/home/user/vim_install/ \
  -it\
  andoer/neovim\
  /bin/bash 
