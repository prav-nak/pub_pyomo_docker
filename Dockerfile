FROM ubuntu:latest
LABEL maintainer="aa <bb@cc.dd>"

RUN apt-get update && \
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion \
    sudo \
    curl \
    git-core \
    gnupg \
    linuxbrew-wrapper \
    locales \
    zsh \
    wget \
    vim \
    nano \
    npm \
    fonts-powerline && \
    locale-gen en_US.UTF-8 && \
    adduser --quiet --disabled-password --shell /bin/bash --home /home/devuser --gecos "User" devuser && \
    echo "devuser:userpassword" | chpasswd &&  usermod -aG sudo devuser

ENV TERM xterm
CMD ["bash"]

RUN mkdir src
COPY Problem.py src/
COPY Scenario.xlsx src/

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates     libglib2.0-0 libxext6 libsm6 libxrender1     git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh &&     wget --quiet https://repo.continuum.io/archive/Anaconda3-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh &&     /bin/bash ~/anaconda.sh -b -p /opt/conda &&     rm ~/anaconda.sh

ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN conda install -c https://conda.anaconda.org/conda-forge pyomo pyomo.extras 
RUN conda install appdirs requests

RUN apt-get update && apt-get install -y glpk-utils

RUN apt-get install -y curl grep sed dpkg && apt-get clean

RUN chmod 777 /src

USER devuser
