FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN echo "hey"
RUN apt-get update
RUN apt-get install -y apt-file
RUN apt-get update
RUN apt-get install -y build-essential \
    checkinstall \
    cmake \
    pkg-config \
    git \
    vim tmux curl
RUN apt-get install -y neovim 
RUN apt-get install -y python3-minimal
RUN apt-get install -y python3-pip 

