#!/bin/bash 

cp Dockerfile Dockerfile.bkp

USERNAME=user 
echo "RUN adduser --disabled-password --gecos \"\" -u $UID $USERNAME"  >> Dockerfile
echo "RUN usermod -aG sudo $USERNAME" >> Dockerfile
echo "RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers" >> Dockerfile
echo "USER $USERNAME" >> Dockerfile
echo "WORKDIR /home/$USERNAME/vim_install" >> Dockerfile
echo "COPY install_python.sh /home/$USERNAME/vim_install/install_python.sh" >> Dockerfile
echo "COPY install.sh /home/$USERNAME/vim_install/install.sh" >> Dockerfile
echo "COPY configs /home/$USERNAME/vim_install/configs">> Dockerfile
echo "ENV NPM_PACKAGES /home/$USERNAME/.npm-packages" >> Dockerfile
echo "ENV PATH /home/$USERNAME/.npm-packages/bin:$PATH" >> Dockerfile

echo "RUN ./install_python.sh" >> Dockerfile
echo "RUN ./install.sh" >> Dockerfile
echo "RUN echo alias vim='nvim'" >> Dockerfile
echo "RUN nvim --headless +PlugInstall +qall" >> Dockerfile 
echo "RUN nvim --headless +'CocInstall -sync coc-snippets' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-prettier' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-jedi' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-highlight' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-eslint' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-json' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocInstall -sync coc-git' +qall" >> Dockerfile
echo "RUN nvim --headless +'CocUpdateSync' +qall" >> Dockerfile

docker build --tag andoer/neovim . 

rm Dockerfile 
mv Dockerfile.bkp Dockerfile


