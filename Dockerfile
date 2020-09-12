FROM elementary/docker

RUN apt-get update && \
      apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
CMD /bin/bash

WORKDIR /home/docker

# Install to make the setupscrip faster
RUN sudo apt install git python3-pip software-properties-common snap -y

RUN pip3 install pyyaml





COPY . /home/docker/eos_setup
