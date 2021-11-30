#!/bin/bash 

./build.sh 

SRC_DIR="$PWD/.." 

docker run\
  --shm-size="2g"\
  -v "$SRC_DIR":/home/user/neovim/ \
  --rm -it\
  andoer/neovim\
  /bin/bash 
