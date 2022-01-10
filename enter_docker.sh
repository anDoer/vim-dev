#!/bin/bash 

./build_docker.sh

SRC_DIR="$PWD" 

docker run\
  --shm-size="2g"\
  -v "$SRC_DIR":/home/user/vim_install/ \
  -v /tmp/.X11-unix:/tmp/.X11 \
  -it\
  --rm \
  andoer/neovim\
  /bin/bash 
