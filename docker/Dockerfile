FROM ubuntu:22.04
ENV DEBIAN_FRONTEND noninteractive
ENV PATH /opt/miniconda3/bin:$PATH
ENV CPLUS_INCLUDE_PATH /opt/miniconda3/include

RUN apt-get update && apt-get install -y apt-file build-essential \
    checkinstall \
    cmake \
    pkg-config \
    git \
    vim tmux curl wget

RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
RUN conda update -y -n base -c defaults conda

RUN conda install python=3.8.0
RUN chmod -R 777 /opt/miniconda3
RUN apt-get -y install sudo software-properties-common

RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update
RUN apt-get -y install neovim
