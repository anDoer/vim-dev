#!/bin/bash

cp Dockerfile Dockerfile.bkp

USERNAME=user
echo "RUN adduser --disabled-password --gecos \"\" -u $UID $USERNAME"  >> Dockerfile
echo "USER $USERNAME" >> Dockerfile

echo "WORKDIR /home/$USERNAME" >> Dockerfile
echo "RUN git clone -b new https://github.com/anDoer/vim-dev.git " >> Dockerfile
echo "WORKDIR /home/$USERNAME/vim-dev" >> Dockerfile
echo "RUN bash install.sh" >> Dockerfile

PATH="/opt/miniconda3/bin:$PATH"

docker build --tag andoer/neovim2 .

rm Dockerfile
mv Dockerfile.bkp Dockerfile
